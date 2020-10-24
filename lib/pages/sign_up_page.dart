import 'package:admin_app/pages/chat_list.dart';
import 'package:admin_app/pages/chat_screen.dart';
import 'package:admin_app/pages/home_page.dart';
import 'package:admin_app/pages/login_page.dart';
import 'package:admin_app/pages/login_page.dart';
import 'package:admin_app/pages/login_page.dart';
import 'package:admin_app/widgets/google_sign_in.dart';
import 'package:admin_app/widgets/my_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _netWorkLodding = false;

  final RegExp regex = RegExp(SignUpPage.pattern);

  GlobalKey<ScaffoldState> myKey = GlobalKey<ScaffoldState>();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController fullName = TextEditingController();

  void submit() async {
    try {
      setState(() {
        _netWorkLodding = true;
      });

      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(result.user.uid)
          .set(
        {
          'userId': result.user.uid,
          'userName': fullName.text,
          'userEmail': email.text,
          'userPassword': password.text,
        },
      );
    } on PlatformException catch (err) {
      var message = 'assar';
      if (err.message != null) {
        message = err.message.toString();
      }
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _netWorkLodding = false;
      });
    } catch (erro) {
      setState(() {
        _netWorkLodding = false;
      });

      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            erro.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChatScreen(),
      ),
    );
    setState(
      () {
        _netWorkLodding = false;
      },
    );
  }

  void checkValid() {
    if (fullName.text.isEmpty && email.text.isEmpty && password.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (fullName.text.length < 3) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (email.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (!regex.hasMatch(email.text)) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (password.text.isEmpty) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else if (password.text.length < 8) {
      myKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } else {
      submit();
    }
  }

  Widget topPart() {
    return Text(
      'Create an Account',
      style: TextStyle(
        color: Color(0xff535353),
        fontSize: 25,
      ),
    );
  }

  Widget textField() {
    return Container(
      height: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextField(
            hitText: 'your name or email id',
            titleText: 'Email Address',
            obscureText: false,
            controller: email,
          ),
          MyTextField(
            hitText: 'Enter your name',
            titleText: 'Your name',
            obscureText: false,
            controller: fullName,
          ),
          MyTextField(
            hitText: 'Type your password',
            titleText: 'Password',
            obscureText: true,
            controller: password,
          ),
        ],
      ),
    );
  }

  Widget myButton(context) {
    return Column(
      children: [
        Container(
            height: 55,
            width: 280,
            child: _netWorkLodding == false
                ? RaisedButton(
                    child: Text(
                      'Create an account',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: Color(0xff4f6eff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    onPressed: () {
                      checkValid();
                    },
                  )
                : CircularProgressIndicator()),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 220,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Have an account?',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff535353),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: 600,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topPart(),
            textField(),
            myButton(context),
          ],
        ),
      ),
    );
  }
}
