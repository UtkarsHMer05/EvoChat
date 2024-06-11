import 'dart:convert';
import 'package:evo_chat/api/api.dart';
import 'package:evo_chat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
            onPressed: () async {
              await Api.auth.signOut();
              await GoogleSignIn().signOut();
            },
            child: Icon(
              Icons.add_comment_sharp,
              color: Color.fromARGB(255, 255, 7, 7),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: Api.firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            final list = [];
            if (snapshot.hasData) {
              final data = snapshot.data?.docs;
              for (var i in data!) {
                print("Data: ${jsonEncode(i.data())}");
                list.add(i.data()["name"]);
              }
            }
            return ListView.builder(
                itemCount: list.length,
                padding: EdgeInsets.only(top: mq.height * .02),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  //return const ChatUserCard();

                  return Text("Name: ${list[index]}");
                });
          },
        ));
  }
}
