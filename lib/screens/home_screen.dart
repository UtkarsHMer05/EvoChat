import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar themes and icons
        appBar: AppBar(
          leading: const Icon(
            CupertinoIcons.home,
            size: 27,
          ),
          //tilte for app bar
          title: const Text("EvoChat 🚀"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                //icons size
                Icons.search_sharp,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_sharp,
                size: 30,
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          // for that button in the bottom to add new users
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 18),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add_comment_sharp,
              color: Color.fromARGB(255, 255, 7, 7),
            ),
          ),
        ));
  }
}
