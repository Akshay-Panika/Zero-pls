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
    apiKey: 'AIzaSyA-gZXiO6HsEQ0yVKBLWcw7aNoKmfMn4AU',
    appId: '1:788261344515:web:459bc11e4bc44febef0536',
    messagingSenderId: '788261344515',
    projectId: 'zeropls24',
    authDomain: 'zeropls24.firebaseapp.com',
    storageBucket: 'zeropls24.firebasestorage.app',
    measurementId: 'G-ZPJ7NHV5XJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5Y7MswThLfc3UhZ7VRLtuiVAoJB4m2ho',
    appId: '1:788261344515:android:f8cd5447c74c343eef0536',
    messagingSenderId: '788261344515',
    projectId: 'zeropls24',
    storageBucket: 'zeropls24.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuhgDSRR7Vd3ZHLnhjsgcOvWADcJ_U7Y4',
    appId: '1:788261344515:ios:e258bb8bc7a2aa4fef0536',
    messagingSenderId: '788261344515',
    projectId: 'zeropls24',
    storageBucket: 'zeropls24.firebasestorage.app',
    iosBundleId: 'com.example.zeroPls',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuhgDSRR7Vd3ZHLnhjsgcOvWADcJ_U7Y4',
    appId: '1:788261344515:ios:e258bb8bc7a2aa4fef0536',
    messagingSenderId: '788261344515',
    projectId: 'zeropls24',
    storageBucket: 'zeropls24.firebasestorage.app',
    iosBundleId: 'com.example.zeroPls',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA-gZXiO6HsEQ0yVKBLWcw7aNoKmfMn4AU',
    appId: '1:788261344515:web:0c371db2f6eab1f6ef0536',
    messagingSenderId: '788261344515',
    projectId: 'zeropls24',
    authDomain: 'zeropls24.firebaseapp.com',
    storageBucket: 'zeropls24.firebasestorage.app',
    measurementId: 'G-D8KHEH6XV7',
  );
}