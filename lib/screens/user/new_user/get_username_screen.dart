import 'package:filsign_learn_app/screens/user/new_user/benefits_preview_1.dart';
import 'package:filsign_learn_app/screens/user/new_user/get_profile_image_screen.dart';
import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

class GetUsernameScreen extends StatefulWidget {
  const GetUsernameScreen({super.key});

  @override
  State<GetUsernameScreen> createState() => _GetUsernameScreenState();
}

class _GetUsernameScreenState extends State<GetUsernameScreen> {
  AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  late String username;

  _submitUsername() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return GetProfileImageScreen(
              username: username,
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Lottie.asset('assets/lottie/username.json',
                    fit: BoxFit.contain, width: 400, height: 200),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hi there, I’m Milio! Nice to meet you! Can you tell me your name?",
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

                //Username Textfield
                Form(
                  key: _formKey,
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xFFAAAAAA)),
                    decoration: InputDecoration(
                      labelText: 'USERNAME',
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      labelStyle: const TextStyle(
                          fontSize: 13.0, color: Color(0xFFC2C2C2)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFCD1F)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFFCD1F)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: const TextStyle(height: 0.5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      username = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Enter to save username to current account
                TextButton(
                  onPressed: () => _submitUsername(),
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFFCD1F),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'ENTER',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
