import 'package:filsign_learn_app/screens/user/new_user/benefits_preview_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';

class BenefitPreview1 extends StatelessWidget {
  const BenefitPreview1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
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
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_og612HbgWj.json',
                    fit: BoxFit.contain,
                    width: 450,
                    height: 225),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const BenefitPreview2();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end);
                          var curvedAnimation =
                              CurvedAnimation(parent: animation, curve: curve);

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
