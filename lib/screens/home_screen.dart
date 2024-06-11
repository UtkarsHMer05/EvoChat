import 'package:evo_chat/api/api.dart';
import 'package:evo_chat/main.dart';
import 'package:evo_chat/models/chat_user.dart';
import 'package:evo_chat/screens/profile_screen.dart';
import 'package:evo_chat/widgets/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar themes and icons
        appBar: AppBar(
          leading: const Icon(
            CupertinoIcons.home,
            size: 27,
          ),
          //title for app bar
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
              //profile setting
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                              user: list[0],
                            )));
              },
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
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              //if some or all data is loaded then show it
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                    [];

                if (list.isNotEmpty) {
                  return ListView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.only(top: mq.height * .02),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatUserCard(user: list[index]);

                        // return Text("Name: ${list[index]}");
                      });
                } else {
                  return const Center(
                    child: Text(
                      "No Connection Found!",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
            }
          },
        ));
  }
}
