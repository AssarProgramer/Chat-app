
import 'package:admin_app/pages/chat_screen.dart';
import 'package:admin_app/pages/home_page.dart';
import 'package:admin_app/pages/sign_up_page.dart';
import 'package:admin_app/widgets/google_sign_in.dart';
import 'package:admin_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  Widget topPart() {
    return Column(
      children: [
        Text(
          'Adman',
          style: TextStyle(
            color: Color(0xff535353),
            fontSize: 20,
          ),
        ),
        Text(
          'Sign in',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xff535353),
          ),
        ),
      ],
    );
  }

  Widget textField() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextField(
            hitText: 'your name or email id',
            titleText: 'Email Address',
            obscureText: false,
          ),
          MyTextField(
            hitText: 'Type your password',
            titleText: 'Password',
            counterText: 'Forget Passowrd?',
            obscureText: true,
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
          child: RaisedButton(
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Color(0xff4f6eff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 260,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dont\'t have an account?',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff535353),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
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

  Widget divider() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            endIndent: 10,
            color: Colors.black,
          ),
        ),
        Text("or"),
        Expanded(
          child: Divider(
            indent: 10,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget fbGoogle(context) {
    return Container(
      width: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              signInWithGoogle().whenComplete(
                () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                },
              ).catchError(
                (e) {
                  _scafoldKey.currentState.showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).errorColor,
                      content: Text(e.toString()),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 45,
              child: Image.asset(
                'images/google.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topPart(),
            textField(),
            myButton(context),
            divider(),
            fbGoogle(context),
          ],
        ),
      ),
    );
  }
}
