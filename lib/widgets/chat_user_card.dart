import 'package:cached_network_image/cached_network_image.dart';
import 'package:evo_chat/main.dart';
import 'package:evo_chat/models/chat_user.dart';
import 'package:evo_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      color: Colors.grey[200],
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ChatScreen(
                        user: widget.user,
                      )));
        },
        child: ListTile(
            //user profile picture
            // child: Icon(
            //   CupertinoIcons.person_fill,
            //   color: Colors.blueAccent,
            // ),
            leading: ClipRRect(
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

            //user name
            title: Text(widget.user.name),
            subtitle: Text(
              //user last message
              widget.user.about,
              maxLines: 1,
            ),
            // trailing: Text(
            //   //user last time sent message
            //   '12:00 PM',
            //   style: TextStyle(color: Colors.black54),
            // ),
            trailing: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 107, 220, 111),
                  borderRadius: BorderRadius.circular(20)),
            )),
      ),
    );
  }
}
