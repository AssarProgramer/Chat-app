import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();

  var _enterMessages = '';
  void _sendMessages() async {
    FocusScope.of(context).unfocus();
    User user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('Chats').add(
      {
        'text': _enterMessages,
        'createdAt': Timestamp.now().millisecondsSinceEpoch.toString(),
        'userId': user.uid,
        'userName': userData.data()["userName"],
      },
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Color(0xffeff2f9),
                  filled: true,
                  hintText: 'Type your qu',
                  // enabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _enterMessages = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Color(0xff4f6eff),
            child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.send, color: Colors.white),
                onPressed:
                    _enterMessages.trim().isEmpty ? null : _sendMessages),
          )
        ],
      ),
    );
  }
}
