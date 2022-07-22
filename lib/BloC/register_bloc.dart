import 'dart:async';

import 'package:test_app/firebase/fire_base_auth.dart';

import '../validators/validation.dart';

class RegisterBloc {
  var _firAuth = FireAuth();

  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInput(String name, String phone, String email, String pass) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Please enter your name");
      return false;
    }
    _nameController.sink.add("OK");
    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Please enter your phone number");
      return false;
    }
    _phoneController.sink.add("OK");
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Please enter your email");
      return false;
    }
    _emailController.sink.add("OK");
    if (pass == null || pass.length < 6) {
      _passController.sink.addError("Must at least 6 characters");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }

  void signUp(String name, String phone, String email, String pass,
      Function onSuccess) {
    _firAuth.signUp(name, phone, email, pass, onSuccess);
  }

  void dispose() {
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
  }
}
