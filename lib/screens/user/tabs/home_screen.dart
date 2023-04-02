import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/warning_dialog.dart';
import 'package:filsign_learn_app/widgets/lesson_tile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/notification.png'),
          ),
        ],

        //filsignlearn LOGO
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'filsignlearn',
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
                'filsignlearn',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            children: [
              //Alphabets I
              const LessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/apple.png',
                lessonImageSrcLocked: 'assets/images/apple_not_active.png',
                lessonProgress: '0 / 7',
                lessonTitle: 'Alphabets I',
                progressValue: 0.15,
                isAvailable: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  //Alphabets II
                  LessonTile(
                    backgroundColor: Color(0xFFB28BE5),
                    lessonImageSrc: 'assets/images/hat.png',
                    lessonImageSrcLocked: 'assets/images/hat_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Alphabets II',
                  ),
                  //Alphabets III
                  LessonTile(
                    backgroundColor: Color(0xFFB28A83),
                    lessonImageSrc: 'assets/images/monke.png',
                    lessonImageSrcLocked: 'assets/images/monke_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Alphabets III',
                  ),
                  //Alphabets IV
                  LessonTile(
                    backgroundColor: Color(0xFFB9E1E8),
                    lessonImageSrc: 'assets/images/umbrella.png',
                    lessonImageSrcLocked:
                        'assets/images/umbrella_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Alphabets IV',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Numbers I
                  LessonTile(
                    backgroundColor: Color(0xFFB28BE5),
                    lessonImageSrc: 'assets/images/one.png',
                    lessonImageSrcLocked: 'assets/images/one_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Numbers I',
                  ),
                  // Numbers II
                  LessonTile(
                    backgroundColor: Color(0xFFFF8C8C),
                    lessonImageSrc: 'assets/images/6.png',
                    lessonImageSrcLocked: 'assets/images/6_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Numbers II',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  //Family I
                  LessonTile(
                    backgroundColor: Color(0xFFB28BE5),
                    lessonImageSrc: 'assets/images/family.png',
                    lessonImageSrcLocked: 'assets/images/family_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Family I',
                  ),

                  //Family II
                  LessonTile(
                    backgroundColor: Color(0xFFA8ADBB),
                    lessonImageSrc: 'assets/images/family1.png',
                    lessonImageSrcLocked:
                        'assets/images/family1_not_active.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Family II',
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return const WarningDialog(
                              title: 'SIGN OUT',
                              cancelButton: true,
                              buttonText: 'SIGN OUT',
                              message: 'Are you sure you want to sign out?');
                        })).then((value) {
                      if (value) {
                        AuthService().signOut();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const PageService();
                        }));
                      }
                    });
                  },
                  child: const Text('Sign out')),
            ],
          ),
        ),
      ),
    );
  }
}
