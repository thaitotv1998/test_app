import 'dart:async';
import 'package:flutter/material.dart';
import '../../BloC/login_bloc.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  LoginBloc loginBloc = new LoginBloc();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Hello\nWelcome back!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: StreamBuilder(
                    stream: loginBloc.userStream,
                    builder: (BuildContext context, snapshot) => TextField(
                      controller: _userController,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "USERNAME",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      StreamBuilder(
                        stream: loginBloc.passStream,
                        builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) =>
                            TextField(
                          controller: _passController,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          obscureText: !_showPass,
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15)),
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Text(_showPass ? "HIDE" : "SHOW",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
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
                      onPressed: onSignInClick,
                      child: Text("SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("NEW USER? SIGN UP",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Text("FORGOT PASSWORD?",
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 15)),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void onSignInClick() {
    setState(() {
      if (loginBloc.isValidInfo(_userController.text, _passController.text))
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
