import 'package:evo_chat/main.dart';
import 'package:evo_chat/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
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
