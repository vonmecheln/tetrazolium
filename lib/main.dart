import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/app_module.dart';
import 'package:tetrazolium/firebase_options.dart';

import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyBoALDHfwECnKwE-zBM5H6Dc40YDBYVWxA',
      iosKey: 'enter ios key here',
      webKey: 'AIzaSyAUVi8-LFLfG5TFAIONlTLIuKdN7TmjO30',
    ),
  );

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
