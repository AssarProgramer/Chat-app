import 'package:flutter/material.dart';

class MessagesBubble extends StatelessWidget {
  final String message;
  final String userName;
  final bool isMe;
  final Key key;

  MessagesBubble(
    this.message,
    this.userName,
    this.isMe, {
    this.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: isMe ? Color(0xff859aff) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
                  bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
                ),
              ),
              width: 150,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                children: <Widget>[
                  Text(
                    message,
                    style: TextStyle(color: isMe ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
