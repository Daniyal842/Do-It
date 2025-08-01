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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAcxJGcJL3jHocEV_LoyM5HMGXQj1_85g8',
    appId: '1:462008610527:web:f6647962f8aff58e4d036a',
    messagingSenderId: '462008610527',
    projectId: 'todoapp-3da56',
    authDomain: 'todoapp-3da56.firebaseapp.com',
    storageBucket: 'todoapp-3da56.firebasestorage.app',
    measurementId: 'G-LTBCBDVDXQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAd5Lroc80czp1NDOizJqaTsVC3PVVBeY',
    appId: '1:462008610527:android:c571e7d51dec6ad24d036a',
    messagingSenderId: '462008610527',
    projectId: 'todoapp-3da56',
    storageBucket: 'todoapp-3da56.firebasestorage.app',
  );
}
