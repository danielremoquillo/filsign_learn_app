import 'package:filsign_learn_app/screens/auth/preview_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/screens/user/new_user/get_username_screen.dart';
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
              return GetUsernameScreen();
            } else {
              return PreviewScreen();
            }
          }),
    );
  }
}
