import 'package:cached_network_image/cached_network_image.dart';
import 'package:evo_chat/api/api.dart';
import 'package:evo_chat/main.dart';
import 'package:evo_chat/models/chat_user.dart';
import 'package:evo_chat/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //app bar themes and icons
        appBar: AppBar(
          //tilte for app bar
          title: const Text("Profile Screen 👔"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              icon: const Icon(
                CupertinoIcons.home,
                size: 27,
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          // for that button in the bottom to add new users
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 18),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.redAccent,
            onPressed: () async {
              await Api.auth.signOut();
              await GoogleSignIn().signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 26,
            ),
            label: const Text(
              "Logout",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mq.width * .05,
          ),
          child: Column(
            children: [
              SizedBox(
                width: mq.width,
                height: mq.height * .03,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .1),
                child: CachedNetworkImage(
                  height: mq.height * .2,
                  width: mq.width * .4,
                  fit: BoxFit.fill,
                  imageUrl: widget.user.image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const CircleAvatar(
                      child: Icon(
                    CupertinoIcons.person_fill,
                    color: Colors.blueAccent,
                  )),
                ),
              ),
              SizedBox(height: mq.height * .03),
              Text(
                widget.user.email,
                style: const TextStyle(color: Colors.black54, fontSize: 18),
              ),
              SizedBox(height: mq.height * .06),
              TextFormField(
                initialValue: widget.user.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_sharp,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
                  hintText: "Eg - Utkarsh Khajuria",
                  label: Text("Name"),
                ),
              ),
              SizedBox(height: mq.height * .02),
              TextFormField(
                initialValue: widget.user.about,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
                  hintText: "Eg - Hey there, I'm using EvoChat!",
                  label: Text("About"),
                ),
              ),
              SizedBox(height: mq.height * .03),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: Size(mq.width * .4, mq.height * .055),
                    backgroundColor: Colors.blue),
                onPressed: () {},
                icon: Icon(
                  Icons.update,
                  size: 26,
                  color: Colors.white,
                ),
                label: Text(
                  "Update Profile",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}
