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
    apiKey: 'AIzaSyBHTStw2ook3snQWpMLIOaWCIqfIex-ekk',
    appId: '1:247732952039:web:5c8c8d1a573335e30a3b42',
    messagingSenderId: '247732952039',
    projectId: 'flutterfire-test-feffa',
    authDomain: 'flutterfire-test-feffa.firebaseapp.com',
    storageBucket: 'flutterfire-test-feffa.appspot.com',
    measurementId: 'G-6LJ97DL538',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDptHcilOyQEUKhBI7FQewblLQjJ1UUsjo',
    appId: '1:247732952039:android:7f69bcc6c325eefe0a3b42',
    messagingSenderId: '247732952039',
    projectId: 'flutterfire-test-feffa',
    storageBucket: 'flutterfire-test-feffa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACVFZX8QPZbh4j6Ax5-p_d13RJ7cpsFZI',
    appId: '1:247732952039:ios:cd1d3a7e7c5fbb0a0a3b42',
    messagingSenderId: '247732952039',
    projectId: 'flutterfire-test-feffa',
    storageBucket: 'flutterfire-test-feffa.appspot.com',
    iosClientId: '247732952039-g1strj67fv1pac0sbu1bkgbutf535slq.apps.googleusercontent.com',
    iosBundleId: 'com.faizlabs.flutterfire',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACVFZX8QPZbh4j6Ax5-p_d13RJ7cpsFZI',
    appId: '1:247732952039:ios:cd1d3a7e7c5fbb0a0a3b42',
    messagingSenderId: '247732952039',
    projectId: 'flutterfire-test-feffa',
    storageBucket: 'flutterfire-test-feffa.appspot.com',
    iosClientId: '247732952039-g1strj67fv1pac0sbu1bkgbutf535slq.apps.googleusercontent.com',
    iosBundleId: 'com.faizlabs.flutterfire',
  );
}
