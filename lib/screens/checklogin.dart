import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/screens/homescreen.dart';
import 'package:flutter_firebase_ui/screens/login_screen.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  late FirebaseAuth _auth;
  late User? _user;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    if (_user != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
