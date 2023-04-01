import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:filsign_learn_app/screens/user/new_user/benefits_preview_1.dart';
import 'package:filsign_learn_app/widgets/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class GetProfileImageScreen extends StatefulWidget {
  const GetProfileImageScreen({Key? key}) : super(key: key);

  @override
  _GetProfileImageScreenState createState() => _GetProfileImageScreenState();
}

class _GetProfileImageScreenState extends State<GetProfileImageScreen> {
  late String _imagePath;
  final List<String> _imagePaths = [
    'assets/images/display_profile.png',
    'assets/images/display_profile_1.png',
    'assets/images/display_profile_2.png',
    'assets/images/display_profile_3.png',
    'assets/images/display_profile_4.png',
    'assets/images/display_profile_5.png',
  ];

  @override
  void initState() {
    super.initState();
    _imagePath = _imagePaths[0];
  }

  void _setImagePath(String imagePath) {
    setState(() {
      _imagePath = imagePath;
    });
  }

  bool _isSelectedImage(String imagePath) {
    return _imagePath == imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _isSelectedImage(_imagePath)
                                      ? const Color(0xFFFFCD1F)
                                      : Colors.transparent,
                                  width: 5.0,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(_imagePath),
                                radius: 50.0,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xFFFFCD1F),
                                    width: 3.0,
                                  ),
                                ),
                                child: _isSelectedImage(_imagePath)
                                    ? const Icon(
                                        Icons.check,
                                        size: 20.0,
                                        color: Color(0xFFFFCD1F),
                                      )
                                    : const Icon(Icons.check,
                                        size: 20.0, color: Colors.transparent),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Wrap(
                          spacing: 16.0,
                          children: _imagePaths.map((imagePath) {
                            return GestureDetector(
                              onTap: () => _setImagePath(imagePath),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _isSelectedImage(imagePath)
                                            ? const Color(0xFFFFCD1F)
                                            : const Color(0xFFE7D6D6),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(imagePath),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),

                    SizedBox(
                      width: 250,
                      child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TyperAnimatedText(
                              "Pick one profile picture that suits you the best!",
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(
                                  fontSize: 16.0, color: Color(0xFFA1A1A1)),
                              speed: const Duration(milliseconds: 50),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //Enter to save username to current account
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ConfirmationDialog(
                              title: 'Confirmation',
                              message: 'Do you want to proceed?',
                            );
                          },
                        ).then((value) {
                          if (value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const BenefitPreview1();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = 0.0;
                                  var end = 2.0;
                                  var curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end);
                                  var curvedAnimation = CurvedAnimation(
                                      parent: animation, curve: curve);

                                  return FadeTransition(
                                    opacity: tween.animate(curvedAnimation),
                                    child: child,
                                  );
                                },
                              ),
                              (route) => false,
                            );
                          } else {
                            // The user cancelled the action
                            // Perform any necessary follow-up tasks here
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFFCD1F),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'PICK',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
