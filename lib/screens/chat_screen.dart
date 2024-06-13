import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:evo_chat/api/api.dart';
import 'package:evo_chat/main.dart';
import 'package:evo_chat/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: Api.getAllMessages(),
                // stream: Api.getAllUsers(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    //if data is loading
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    //if some or all data is loaded then show it
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      print('Data: ${jsonEncode(data![0].data())}');
                      // _list = data
                      //         ?.map((e) => ChatUser.fromJson(e.data()))
                      //         .toList() ??
                      //     [];
                      final _list = [];
                      if (_list.isNotEmpty) {
                        return ListView.builder(
                            itemCount: _list.length,
                            padding: EdgeInsets.only(top: mq.height * .02),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Text("Name: ${_list[index]}");
                            });
                      } else {
                        return const Center(
                          child: Text(
                            "Say Hii !!👋",
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      }
                  }
                },
              ),
            ),
            _chatInput()
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return InkWell(
      onTap: () {},
      child: Row(children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(mq.height * .2),
          child: CachedNetworkImage(
            height: mq.height * .05,
            width: mq.width * .1,
            fit: BoxFit.fill,
            imageUrl: widget.user.image,
            errorWidget: (context, url, error) => const CircleAvatar(
                child: Icon(
              CupertinoIcons.person_fill,
              color: Colors.blueAccent,
            )),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.user.name,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Last Seen Not Available',
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _chatInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: mq.height * .01, horizontal: mq.width * .025),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions),
                    color: Colors.blueAccent,
                  ),
                  const Expanded(
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          hintText: 'Type Something.....',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image,
                      color: Colors.blueAccent,
                      size: 26,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_sharp,
                      size: 26,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    width: mq.width * .015,
                  )
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            minWidth: 0,
            shape: const CircleBorder(),
            color: Colors.greenAccent,
            child: const Icon(
              Icons.send,
              color: Colors.blueAccent,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
