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
    apiKey: 'AIzaSyCSLQ8Ytfo9n0GYAC1LL-AT2q9n2Tl8Rjk',
    appId: '1:336703118862:web:8c8075a7caf9176768e65f',
    messagingSenderId: '336703118862',
    projectId: 'fruits-hub-af371',
    authDomain: 'fruits-hub-af371.firebaseapp.com',
    storageBucket: 'fruits-hub-af371.firebasestorage.app',
    measurementId: 'G-3G7X81DRH5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6R1J6UB1KKGR_vSuliPIGkIQQKqltYB8',
    appId: '1:336703118862:android:2a9c791b1875183c68e65f',
    messagingSenderId: '336703118862',
    projectId: 'fruits-hub-af371',
    storageBucket: 'fruits-hub-af371.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDd2VuKDD5QzbHIaUrOtO_wLK8kNJzVntE',
    appId: '1:336703118862:ios:50b4c3c9b202b42168e65f',
    messagingSenderId: '336703118862',
    projectId: 'fruits-hub-af371',
    storageBucket: 'fruits-hub-af371.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDd2VuKDD5QzbHIaUrOtO_wLK8kNJzVntE',
    appId: '1:336703118862:ios:50b4c3c9b202b42168e65f',
    messagingSenderId: '336703118862',
    projectId: 'fruits-hub-af371',
    storageBucket: 'fruits-hub-af371.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCSLQ8Ytfo9n0GYAC1LL-AT2q9n2Tl8Rjk',
    appId: '1:336703118862:web:e325537feba6cb7368e65f',
    messagingSenderId: '336703118862',
    projectId: 'fruits-hub-af371',
    authDomain: 'fruits-hub-af371.firebaseapp.com',
    storageBucket: 'fruits-hub-af371.firebasestorage.app',
    measurementId: 'G-87LMG1BR4F',
  );
}
