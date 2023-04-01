import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/lesson_tile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/philippine.png'),
        ),
        title: const Text(
          'FILIPINO SIGN LANGUAGE',
          style: TextStyle(fontSize: 15),
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
                backgroundColor: Color(0xFFFF8C8C),
                lessonImageSrc: 'assets/images/apple.png',
                lessonProgress: '4 / 7',
                lessonTitle: 'Alphabets I',
                progressValue: 0.9,
                isAvailable: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  //Alphabets II
                  LessonTile(
                    backgroundColor: Color(0xFFF0C398),
                    lessonImageSrc: 'assets/images/hat.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Alphabets II',
                  ),
                  //Alphabets III
                  LessonTile(
                    backgroundColor: Color(0xFFAF6E5A),
                    lessonImageSrc: 'assets/images/monke.png',
                    lessonProgress: '0 / 7',
                    lessonTitle: 'Alphabets III',
                  ),
                  //Alphabets IV
                  LessonTile(
                    backgroundColor: Color(0xFF01C0FA),
                    lessonImageSrc: 'assets/images/umbrella.png',
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
                    backgroundColor: Color(0xFFFFB9A9),
                    lessonImageSrc: 'assets/images/one.png',
                    lessonProgress: '4 / 7',
                    lessonTitle: 'Numbers I',
                  ),
                  // Numbers II
                  LessonTile(
                    backgroundColor: Color(0xFFFF8C8C),
                    lessonImageSrc: 'assets/images/6.png',
                    lessonProgress: '4 / 7',
                    lessonTitle: 'Numbers II',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  //Family I
                  LessonTile(
                    backgroundColor: Color(0xFFFF7196),
                    lessonImageSrc: 'assets/images/family.png',
                    lessonProgress: '4 / 7',
                    lessonTitle: 'Family I',
                  ),

                  //Family II
                  LessonTile(
                    backgroundColor: Color(0xFF80E0B7),
                    lessonImageSrc: 'assets/images/family1.png',
                    lessonProgress: '4 / 7',
                    lessonTitle: 'Family II',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
