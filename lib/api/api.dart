import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Api {
  //for auth
  static FirebaseAuth auth = FirebaseAuth.instance;

  //for storing messages in could firebase

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
