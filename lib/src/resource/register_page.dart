import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../BloC/register_bloc.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  RegisterBloc registerBloc = new RegisterBloc();

  bool _showPass = false;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  @override
  void dispose() {
    registerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffd8d8d8),
                    ),
                    child: FlutterLogo(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Create a new account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: StreamBuilder(
                    stream: registerBloc.nameStream,
                    builder: (BuildContext context, snapshot) => TextField(
                      controller: _nameController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Name",
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: StreamBuilder(
                    stream: registerBloc.phoneStream,
                    builder: (BuildContext context, snapshot) => TextField(
                      controller: _phoneController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Phone",
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: StreamBuilder(
                    stream: registerBloc.emailStream,
                    builder: (BuildContext context, snapshot) => TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Email",
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      StreamBuilder(
                        stream: registerBloc.passStream,
                        builder: (BuildContext context, snapshot) => TextField(
                          controller: _passController,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                            labelText: "Password",
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: TextStyle(
                                color: Color(0xff888888), fontSize: 15),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: GestureDetector(
                          onTap: onToggleShowPass,
                          child: Text(_showPass ? "HIDE" : "SHOW",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: onSignUpClick,
                      child: Text("SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                              mouseCursor: SystemMouseCursors.click,
                              text: "Sign in now",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void onSignUpClick() {
    setState(() {
      var isValid = registerBloc.isValidInput(_nameController.text,
          _phoneController.text, _emailController.text, _passController.text);
      if (isValid) {
        registerBloc.signUp(_nameController.text, _phoneController.text,
            _emailController.text, _passController.text, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      }
    });
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
