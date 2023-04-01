import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/db_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  AuthService _authService = AuthService();
  DBService dbService = DBService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/philippine.png'),
        ),
        title: const Text(
          'PROFILE',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: dbService.getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset(snapshot.data!['profileUrl'],
                          height: 100.0,
                          width: 100.0,
                          fit: BoxFit.cover, frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                          child: child,
                        );
                      }),
                    ),
                    Text(snapshot.data!['username']),
                    Text(snapshot.data!['email']),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      _authService.signOut();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const PageService();
                      }));
                    },
                    child: const Text('Sign out')),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
