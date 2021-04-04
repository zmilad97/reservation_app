import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  IconData visible = Icons.visibility;
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if(_obscureText == true)
        visible = Icons.visibility;
      else
        visible = Icons.visibility_off;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF00203F),
            height: 2,
          ),
        ),
        Text(
          "Reservation App",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00203F),
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          "Please login to continue",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF00203F),
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: phonenumberController,
          style: TextStyle(color: Color(0xFFECCB45)),
          decoration: InputDecoration(
            hintText: 'Phone Number ',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFFECCB45),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Color(0xFF1A485A),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          style: TextStyle(color: Color(0xFFECCB45)),
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFFD9BC43),
              fontWeight: FontWeight.bold,
            ),
            suffix: InkWell(
              onTap: _toggle,
              child: Icon(visible,
              color: Color(0xFFD9BC43),),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Color(0xFF1A485A),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/loading',
                arguments: {
                  'username': '${phonenumberController.text}',
                  'password': '${passwordController.text}',
                });
          },
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xFF00203F),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF1C1C1C).withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF3D657),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00203F),
            height: 1,
          ),
        ),
      ],
    );
  }
}
