import 'dart:io';
import 'package:evo_chat/helper/dialogs.dart';
import 'package:evo_chat/main.dart';
import 'package:evo_chat/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleButtonClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) async {
      //for deleting the progress bar
      Navigator.pop(context);
      if (user != null) {
        print("\nUser: ${user.user}");
        print("\nUser: ${user.additionalUserInfo}");
        if ((await Api.userExists())) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      } else {
        Api.createUser().then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        });
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup("google.com");
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await Api.auth.signInWithCredential(credential);
    } catch (e) {
      print('_signInWithGoogle: $e');
      Dialogs.showSnackbar(context,
          'SomeThing is Wrong with Your Internet Connect(please check it)!');
      return null;
    }
  }
  //sign out function
  // _signOut() async{
  //   await FirebaseAuth.instance.signOut;
  //   await GoogleSignIn().signOut();
  // }

  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return Scaffold(
      //app bar themes and icons
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //title for app bar
        title: const Text(" Welcome to EvoChat 🚀"),
      ),
      //body
      body: Stack(
        children: [
          //app logo
          AnimatedPositioned(
              top: mq.height * .15,
              width: mq.width * .7,
              right: _isAnimate ? mq.width * .175 : -mq.width * .7,
              duration: const Duration(seconds: 1),
              child: Image.asset("assets/images/chat.png")),
          AnimatedPositioned(
              bottom: mq.height * .15,
              width: mq.width * .9,
              left: _isAnimate ? mq.width * .05 : -mq.width * .9,
              height: mq.height * .07,
              duration: const Duration(seconds: 1),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: const StadiumBorder(),
                    elevation: 1),
                onPressed: () {
                  _handleGoogleButtonClick();
                },
                icon: Image.asset(
                  "assets/images/google.png",
                  height: mq.height * .65,
                ),
                label: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                        children: [
                      TextSpan(text: "Signin' with "),
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
              ))
        ],
      ),
    );
  }
}
