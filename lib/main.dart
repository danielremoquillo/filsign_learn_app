import 'package:filsign_learn_app/screens/user/new_user/benefits_preview_1.dart';
import 'package:filsign_learn_app/screens/user/new_user/benefits_preview_2.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Splash Screen Timeout
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  await Firebase.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filsignlearn App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.orange,
          fontFamily: 'Fredoka'),
      home: const PageService(),
    );
  }
}
