import 'package:EvoChat/api/api.dart';
import 'package:EvoChat/main.dart';
import 'package:EvoChat/screens/auth/login_screen.dart';
import 'package:EvoChat/screens/home_screen.dart';
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

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white));
      //navigation to home screen
      if (Api.auth.currentUser != null) {
        print("\nUser: ${Api.auth.currentUser}");

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
        title: const Text(
          " Welcome to EvoChat 🚀",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
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
