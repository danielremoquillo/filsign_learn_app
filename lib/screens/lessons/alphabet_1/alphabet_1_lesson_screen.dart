import 'package:filsign_learn_app/screens/lessons/alphabet_1/alphabet_1_lesson_1_main_screen.dart';
import 'package:filsign_learn_app/widgets/sub_lesson_tile.dart';
import 'package:flutter/material.dart';

class Alphabet1LessonScreen extends StatelessWidget {
  const Alphabet1LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'Alphabets I',
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
                'Alphabets I',
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_welcome.png',
                lessonTitle: '01. WELCOME MESSAGE',
                pageRoute: Alphabet1Lesson1Screen(),
                isStart: true,
                lessonImageSrcLocked: 'assets/images/sublesson_welcome.png',
                progressValue: 1,
                isAvailable: true,
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_A.png',
                lessonTitle: '02. ALPHABET A',
                lessonImageSrcLocked:
                    'assets/images/sublesson_A_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_B.png',
                lessonTitle: '03. ALPHABET B',
                lessonImageSrcLocked:
                    'assets/images/sublesson_B_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_C.png',
                lessonTitle: '04. ALPHABET C',
                lessonImageSrcLocked:
                    'assets/images/sublesson_C_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_D.png',
                lessonTitle: '05. ALPHABET D',
                lessonImageSrcLocked:
                    'assets/images/sublesson_D_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_E.png',
                lessonTitle: '06. ALPHABET E',
                lessonImageSrcLocked:
                    'assets/images/sublesson_E_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_F.png',
                lessonTitle: '07. ALPHABET F',
                lessonImageSrcLocked:
                    'assets/images/sublesson_F_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_G.png',
                lessonTitle: '08. ALPHABET G',
                lessonImageSrcLocked:
                    'assets/images/sublesson_G_not_active.png',
              ),
              SubLessonTile(
                backgroundColor: Color(0xFFFF7B94),
                lessonImageSrc: 'assets/images/sublesson_END.png',
                lessonTitle: 'FINISH',
                isEnd: true,
                isAvailable: false,
                lessonImageSrcLocked:
                    'assets/images/sublesson_END_not_active.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
