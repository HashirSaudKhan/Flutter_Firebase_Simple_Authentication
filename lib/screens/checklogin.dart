import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/screens/homescreen.dart';
import 'package:flutter_firebase_ui/screens/login_screen.dart';

class CheckLogin {
  static Widget check(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
