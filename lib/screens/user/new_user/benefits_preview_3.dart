import 'package:filsign_learn_app/screens/user/main_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';

class BenefitPreview3 extends StatelessWidget {
  const BenefitPreview3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  alignment: Alignment.centerLeft,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 28,
                    color: Color(0xFFAAAAAA),
                  )),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: WaveClipperOne(reverse: true),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.39,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFFFE178),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.39,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFFFCD1F),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                ),
                Lottie.asset('assets/lottie/benefit3.json',
                    fit: BoxFit.contain, width: 450, height: 225),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Learn how to use the alphabet in sign language to communicate with your hands.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Color(0xFFFFFFFF)),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Color(0xFFE7D6D6)),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "LET'S START",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFCD1F)),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
