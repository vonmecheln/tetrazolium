// ignore_for_file: lines_longer_than_80_chars
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
  static FirebaseOptions currentPlatform({
    required String webKey,
    required String iosKey,
    required String androidKey,
  }) {
    if (kIsWeb) {
      return web(webKey);
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android(androidKey);
      case TargetPlatform.iOS:
        return ios(iosKey);
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static FirebaseOptions web(String apiKey) => FirebaseOptions(
      apiKey: apiKey,
      appId: '1:1079604424773:web:d4279638eabbdbdbc1732c',
      messagingSenderId: '1079604424773',
      projectId: 'tetrazolium-vonseeds',
      authDomain: 'tetrazolium-vonseeds.firebaseapp.com',
      storageBucket: 'tetrazolium-vonseeds.appspot.com',
      databaseURL: "https://tetrazolium-vonseeds.firebaseio.com",
      measurementId: "G-7HGG3YMC32");

  static FirebaseOptions android(String apiKey) => FirebaseOptions(
        apiKey: apiKey,
        appId: '1:1079604424773:android:764e6a94d6021a6dc1732c',
        messagingSenderId: '1079604424773',
        projectId: 'tetrazolium-vonseeds',
        storageBucket: 'tetrazolium-vonseeds.appspot.com',
      );

  static FirebaseOptions ios(String apiKey) => FirebaseOptions(
        apiKey: apiKey,
        appId: '',
        messagingSenderId: '',
        projectId: '',
        storageBucket: '',
        iosClientId: '',
        iosBundleId: '',
      );
}
