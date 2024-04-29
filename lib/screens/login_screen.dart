import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/components/roundbutton.dart';
import 'package:flutter_firebase_ui/screens/signup_screen.dart';
import 'package:flutter_firebase_ui/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // for validation
  final _formkey = GlobalKey<FormState>();

  // Email controller
  final emailcontroller = TextEditingController();

  // Password controller
  final passwordcontroller = TextEditingController();

  // Initializing firebaseAuth instance

  FirebaseAuth _auth = FirebaseAuth.instance;

  //disposing email and password controller mean release this controller from memory when screen is not open
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  //Login Function
  void login() async {
    // _auth
    //     .signInWithEmailAndPassword(
    //         email: emailcontroller.text.toString(),
    //         password: passwordcontroller.text.toString())
    //     .then((value) {
    //   Utils.toastmsg(context, value.user!.email.toString());
    // }).onError((error, stackTrace) {
    //   debugPrint(error.toString());
    //   Utils.toastmsg(context, error.toString());
    // });

    try {
      await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      debugPrint(e.code);
      if (e.code == 'user-not-found') {
        debugPrint('The account does not exist');
      }
      if (e.code == 'wrong-password') {
        debugPrint('Incorrect password. Please try again.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Center(child: Text('Login')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Form widget use to validate email and password is empty or not
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter email';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter password';
                          }
                          return null;
                        }),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            RoundButton(
              title: 'Login',
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  login();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignupScreen())));
                    },
                    child: const Text('Sign up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
