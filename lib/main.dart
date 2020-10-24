import 'package:admin_app/pages/chat_list.dart';
import 'package:admin_app/pages/chat_screen.dart';
import 'package:admin_app/pages/home_page.dart';
import 'package:admin_app/pages/login_page.dart';
import 'package:admin_app/pages/messages.dart';
import 'package:admin_app/pages/new_messages.dart';
import 'package:admin_app/pages/sign_up_page.dart';
import 'package:admin_app/tast/food_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapShot) {
          if(snapShot.hasData){
            return ChatScreen();
          }return LoginPage();
        },
      ),
    
    );
  }
}
