import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/db_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/warning_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  DBService dbService = DBService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.power_settings_new_outlined,
              color: Color(0xFFFF7B94),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 23,
                  letterSpacing: 0.3,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.8
                    ..color = Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Profile',
                style: TextStyle(
                  letterSpacing: 0.3,
                  fontSize: 23,
                  color: Color(0xFFFFCD1F),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future: dbService.getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.5, color: Colors.black),
                          ),
                          child: CircleAvatar(
                              maxRadius: 40,
                              minRadius: 20,
                              backgroundImage:
                                  AssetImage(snapshot.data!['profileUrl'])),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Username
                            Text(
                              snapshot.data!['username'],
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: Color(0xFFFFCD1F),
                                  fontWeight: FontWeight.w500),
                            ),

                            //Email
                            Text(
                              snapshot.data!['email'],
                              style: const TextStyle(color: Color(0xFFA1A1A1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'ACHIEVEMENTS',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
