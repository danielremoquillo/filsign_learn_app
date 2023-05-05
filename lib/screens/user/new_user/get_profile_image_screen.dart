import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:filsign_learn_app/screens/user/new_user/benefits_main_screen.dart';
import 'package:filsign_learn_app/services/db_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/confirm_dialog.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/success_dialog.dart';
import 'package:filsign_learn_app/widgets/main_button.dart';
import 'package:flutter/material.dart';

class GetProfileImageScreen extends StatefulWidget {
  const GetProfileImageScreen(
      {Key? key, required this.username, required this.cameras})
      : super(key: key);
  final String username;
  final List<CameraDescription> cameras;

  @override
  _GetProfileImageScreenState createState() => _GetProfileImageScreenState();
}

class _GetProfileImageScreenState extends State<GetProfileImageScreen> {
  DBService dbService = DBService();

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

  _storeUserDetails() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ConfirmationDialog(
          title: 'Confirmation',
          message: 'Do you want to proceed?',
          buttonText: 'PROCEED',
        );
      },
    ).then((value) {
      if (value) {
        showDialog(
            context: context,
            builder: (context) {
              return const SuccessDialog(
                title: 'SUCCESS',
                message: 'Saved successfully.',
                buttonText: 'PROCEED',
              );
            }).then((value) => Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1000),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const BenefitMainScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = 0.0;
                  var end = 2.0;
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
            ));
      }
    });
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
                                      ? const Color(0xFF01CF8E)
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
                                    color: const Color(0xFF01CF8E),
                                    width: 3.0,
                                  ),
                                ),
                                child: _isSelectedImage(_imagePath)
                                    ? const Icon(
                                        Icons.check,
                                        size: 20.0,
                                        color: Color(0xFF01CF8E),
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
                              onTap: () {
                                _setImagePath(imagePath);
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _isSelectedImage(imagePath)
                                            ? const Color(0xFF01CF8E)
                                            : Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 30.0,
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

                    const Text(
                      "Pick one profile picture that suits you the best!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFFA1A1A1)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //Enter to save username to current account
                    TextButton(
                      onPressed: () {
                        _storeUserDetails();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFFCD1F),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      child: const MainButtonChild(
                          buttonText: 'PICK', buttonTextColor: Colors.white),
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
