import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/Providers/loadingcircleprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_ui/screens/checklogin.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoadingCircleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CheckLogin.check(context),
      ),
    );
  }
}
