import 'dart:ui';
import 'package:admin_app/pages/chat_list.dart';
import 'package:admin_app/pages/messages.dart';
import 'package:admin_app/pages/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _messaging.requestNotificationPermissions();
    _messaging.configure(
      onMessage: (msg) {
        print(msg);
        return;
      },
      onLaunch: (msg) {
        print(msg);
        return;
      },
      onResume: (msg) {
        print(msg);
        return;
      },
    );
  }

  Widget topCircle() {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AssarBaloch',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff817d7d)),
            ),
            Text(
              'Admin',
              style: TextStyle(
                color: Color(0xff817d7d),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget listTile({IconData iconData, String name, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(iconData),
      title: Text(
        name,
        style: TextStyle(
          color: Color(
            0xff817d7d,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 300,
              child: DrawerHeader(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topCircle(),
                    listTile(
                        iconData: Icons.supervisor_account,
                        name: 'Customer list',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChatList(),
                            ),
                          );
                        }),
                    listTile(
                      iconData: Icons.notifications_active,
                      name: 'Notifications',
                    ),
                    listTile(
                      iconData: Icons.chat,
                      name: 'Chat',
                    ),
                  ],
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: listTile(
                  iconData: Icons.exit_to_app,
                  name: 'Logout',
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Chat App'),
        backgroundColor: Color(0xff4f6eff),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.account_circle),
          )
          // DropdownButton(
          //   icon: Icon(

          //     Icons.more_vert,
          //     color: Colors.white,
          //   ),
          //   items: [
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backgroundchat.png'),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
