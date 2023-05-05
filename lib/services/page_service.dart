import 'package:filsign_learn_app/main.dart';
import 'package:filsign_learn_app/screens/auth/preview_screen.dart';
import 'package:filsign_learn_app/screens/user/main_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/screens/user/new_user/get_username_screen.dart';
import 'package:filsign_learn_app/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PageService extends StatefulWidget {
  const PageService({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<PageService> createState() => _PageServiceState();
}

class _PageServiceState extends State<PageService> {
  DBService dbService = DBService();
  bool isNewUser = false;

  @override
  void initState() {
    // To know if the user is new or not
    dbService.isNewUser().then((snapshot) {
      isNewUser = snapshot;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              if (isNewUser) {
                return GetUsernameScreen(cameras: widget.cameras);
              } else {
                return MainScreen(
                  cameras: [],
                );
              }
            } else {
              return PreviewScreen(
                cameras: cameras,
              );
            }
          }),
    );
  }
}
