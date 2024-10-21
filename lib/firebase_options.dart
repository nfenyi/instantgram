// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyB9WbvVd_UnJkdcslbnA5F1Nc-Ma2D27Ps',
    appId: '1:833711512388:web:a8436f96cb63c09efb9511',
    messagingSenderId: '833711512388',
    projectId: 'fenyi-ig-clone',
    authDomain: 'fenyi-ig-clone.firebaseapp.com',
    storageBucket: 'fenyi-ig-clone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBeGK68-ur0yA3NkU-sTBAUK9mq8A7gAw',
    appId: '1:833711512388:android:a0e6861bc890ccbcfb9511',
    messagingSenderId: '833711512388',
    projectId: 'fenyi-ig-clone',
    storageBucket: 'fenyi-ig-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVCJcLd9ZZxknyImkS_VwDnQLKZZ35arY',
    appId: '1:833711512388:ios:719b6bf9e298e94ffb9511',
    messagingSenderId: '833711512388',
    projectId: 'fenyi-ig-clone',
    storageBucket: 'fenyi-ig-clone.appspot.com',
    iosBundleId: 'com.example.instantgram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVCJcLd9ZZxknyImkS_VwDnQLKZZ35arY',
    appId: '1:833711512388:ios:0e0bb2dd96646f40fb9511',
    messagingSenderId: '833711512388',
    projectId: 'fenyi-ig-clone',
    storageBucket: 'fenyi-ig-clone.appspot.com',
    iosBundleId: 'com.example.instantgram.RunnerTests',
  );
}
