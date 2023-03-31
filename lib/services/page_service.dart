import 'package:filsign_learn_app/screens/home_screen.dart';
import 'package:filsign_learn_app/screens/preview_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageService extends StatelessWidget {
  const PageService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return HomeScreen();
            } else {
              return PreviewScreen();
            }
          }),
    );
  }
}
