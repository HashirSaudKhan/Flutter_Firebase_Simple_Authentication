// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB13guBmFHUEXKp1YcV4YPtcknFUoAVc-Q',
    appId: '1:626201418297:web:196dce45411e1a4b550be8',
    messagingSenderId: '626201418297',
    projectId: 'dummy-da4f8',
    authDomain: 'dummy-da4f8.firebaseapp.com',
    databaseURL: 'https://dummy-da4f8-default-rtdb.firebaseio.com',
    storageBucket: 'dummy-da4f8.appspot.com',
    measurementId: 'G-Q79HQKSV6P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzXSo_dRbeAY-5qdniz9bp_38Tpc4Nj1A',
    appId: '1:626201418297:android:6674364383de52ec550be8',
    messagingSenderId: '626201418297',
    projectId: 'dummy-da4f8',
    databaseURL: 'https://dummy-da4f8-default-rtdb.firebaseio.com',
    storageBucket: 'dummy-da4f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw4IlnTU_vj6YDP0FZgt4I8YGPmxBfbjc',
    appId: '1:626201418297:ios:5ec12c64d558e300550be8',
    messagingSenderId: '626201418297',
    projectId: 'dummy-da4f8',
    databaseURL: 'https://dummy-da4f8-default-rtdb.firebaseio.com',
    storageBucket: 'dummy-da4f8.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCw4IlnTU_vj6YDP0FZgt4I8YGPmxBfbjc',
    appId: '1:626201418297:ios:5ec12c64d558e300550be8',
    messagingSenderId: '626201418297',
    projectId: 'dummy-da4f8',
    databaseURL: 'https://dummy-da4f8-default-rtdb.firebaseio.com',
    storageBucket: 'dummy-da4f8.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseUi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB13guBmFHUEXKp1YcV4YPtcknFUoAVc-Q',
    appId: '1:626201418297:web:30ec0cb66a13f58b550be8',
    messagingSenderId: '626201418297',
    projectId: 'dummy-da4f8',
    authDomain: 'dummy-da4f8.firebaseapp.com',
    databaseURL: 'https://dummy-da4f8-default-rtdb.firebaseio.com',
    storageBucket: 'dummy-da4f8.appspot.com',
    measurementId: 'G-HN8RFY5W4B',
  );

}