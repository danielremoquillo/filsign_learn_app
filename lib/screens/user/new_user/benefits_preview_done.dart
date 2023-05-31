import 'package:filsign_learn_app/screens/user/main_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';

class BenefitPreviewDone extends StatelessWidget {
  const BenefitPreviewDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/benefit4.png',
                fit: BoxFit.contain, width: 350, height: 175),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "That's all!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "We hope you enjoy our app. Thank you!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return MainScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = 0.0;
                      var end = 1.0;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end);
                      var curvedAnimation =
                          CurvedAnimation(parent: animation, curve: curve);

                      return FadeTransition(
                        opacity: tween.animate(curvedAnimation),
                        child: child,
                      );
                    },
                  ),
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFDE65F),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
              child: const MainButtonChild(
                  buttonText: 'ENTER', buttonTextColor: Colors.white),
            ),
          ],
        ),
      )),
    );
  }
}
