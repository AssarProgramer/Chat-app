import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String titleText;
  final String hitText;
  final String counterText;
  final bool obscureText;
  final TextEditingController controller ;
  MyTextField(
      {this.controller,this.hitText, this.titleText, this.counterText, this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(fontSize: 17, color: Color(0xff535353)),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            counterText: counterText,
            counterStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            hintText: hitText,
            enabledBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
