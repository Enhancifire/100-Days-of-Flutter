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
    apiKey: 'AIzaSyBKa9B3Tq0k6sJlTTwcvZfHpX-NGrwil1c',
    appId: '1:932040958224:web:a61bb00431fa47da670595',
    messagingSenderId: '932040958224',
    projectId: 'api-assignment-3ced0',
    authDomain: 'api-assignment-3ced0.firebaseapp.com',
    storageBucket: 'api-assignment-3ced0.appspot.com',
    measurementId: 'G-VJDLGEYQ10',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmN6tjm0byN2rLyz3VqV6Mz24VePllaoQ',
    appId: '1:932040958224:android:d16ff5b1fc0449e5670595',
    messagingSenderId: '932040958224',
    projectId: 'api-assignment-3ced0',
    storageBucket: 'api-assignment-3ced0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg79A_0-qqNYwTzfIj5EF9B-0p7CGFno0',
    appId: '1:932040958224:ios:288841706718e144670595',
    messagingSenderId: '932040958224',
    projectId: 'api-assignment-3ced0',
    storageBucket: 'api-assignment-3ced0.appspot.com',
    iosClientId: '932040958224-dnbcl5bilht1ujm1iule41voj7d943jg.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg79A_0-qqNYwTzfIj5EF9B-0p7CGFno0',
    appId: '1:932040958224:ios:288841706718e144670595',
    messagingSenderId: '932040958224',
    projectId: 'api-assignment-3ced0',
    storageBucket: 'api-assignment-3ced0.appspot.com',
    iosClientId: '932040958224-dnbcl5bilht1ujm1iule41voj7d943jg.apps.googleusercontent.com',
    iosBundleId: 'com.example.apiAssignment',
  );
}
