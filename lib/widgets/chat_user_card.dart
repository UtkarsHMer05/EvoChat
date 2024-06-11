import 'package:evo_chat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

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
        onTap: () {},
        child: const ListTile(
          leading: CircleAvatar(
            //user profile picture
            child: Icon(
              CupertinoIcons.person_fill,
              color: Colors.blueAccent,
            ),
            backgroundColor: Colors.greenAccent,
          ),
          //user name
          title: Text("Utkarsh"),
          subtitle: Text(
            //user last message
            "Last User Message",
            maxLines: 1,
          ),
          trailing: Text(
            //user last time sent message
            '12:00 PM',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
