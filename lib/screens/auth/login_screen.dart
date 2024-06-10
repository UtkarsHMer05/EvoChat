import 'package:evo_chat/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .15,
              width: mq.width * .7,
              left: mq.width * .175,
              child: Image.asset("assets/images/chat.png")),
          Positioned(
              bottom: mq.height * .15,
              width: mq.width * .9,
              left: mq.width * .05,
              height: mq.height * .07,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: const StadiumBorder(),
                    elevation: 1),
                onPressed: () {},
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
