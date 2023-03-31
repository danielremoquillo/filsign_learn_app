import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(user.email ?? ''),
              TextButton(
                  onPressed: () {
                    _authService.signOut();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PageService();
                    }));
                  },
                  child: Text('Sign out')),
            ],
          ),
        ),
      ),
    );
  }
}
