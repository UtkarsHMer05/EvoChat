import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evo_chat/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Api {
  //for auth
  static FirebaseAuth auth = FirebaseAuth.instance;

  //for storing messages in could firebase

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
//for storing self info
  static ChatUser me = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "Hey, I'm using We Chat!",
      image: user.photoURL.toString(),
      createdAt: '',
      isOnline: false,
      lastActive: '',
      pushToken: '');
  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;
//to return current user
  static User get user => auth.currentUser!;

  // for checking if user exists or not?
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  static Future<void> getSelfInfo() async {
    await firestore.collection('user').doc(user.uid).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  //for creating a new user
  static Future<void> createUser() async {
    final time = DateTime.now().microsecondsSinceEpoch.toString();

    final chatUser = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "Hey there ,I'm using EvoChat!",
      image: user.photoURL.toString(),
      createdAt: time,
      isOnline: false,
      lastActive: time,
      pushToken: "",
    );

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return Api.firestore
        .collection('users')
        .where("id", isNotEqualTo: user.uid)
        .snapshots();
  }

  // for updating user information
  static Future<void> updateUserInfo() async {
    await firestore.collection('users').doc(user.uid).update({
      'name': me.name,
      'about': me.about,
    });
  }
}
