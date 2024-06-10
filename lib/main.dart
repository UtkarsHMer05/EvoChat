import 'package:evo_chat/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

//global object for accessing device screen size
late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EvoChat 🚀",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 232, 0, 0)),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color.fromARGB(255, 0, 255, 162),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
