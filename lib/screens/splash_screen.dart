import 'package:evo_chat/main.dart';
import 'package:evo_chat/screens/auth/login_screen.dart';
import 'package:evo_chat/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      //navigation to home screen
      if (FirebaseAuth.instance.currentUser != null) {
        print("\nUser: ${FirebaseAuth.instance.currentUser}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
              right: mq.width * .175,
              duration: const Duration(seconds: 1),
              child: Image.asset("assets/images/chat.png")),
          Positioned(
              bottom: mq.height * .15,
              width: mq.width,
              child: const Text(
                "MADE BY UTKARSH 🚀 ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5),
              ))
        ],
      ),
    );
  }
}
