import 'package:camera/camera.dart';
import 'package:filsign_learn_app/screens/auth/sign_in_screen.dart';
import 'package:filsign_learn_app/screens/auth/sign_up_screen.dart';
import 'package:filsign_learn_app/widgets/custom_will_pop_scope.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/warning_dialog.dart';
import 'package:filsign_learn_app/screens/user/new_user/get_username_screen.dart';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: ((context) {
              return const WarningDialog(
                  title: 'EXIT APP',
                  message: 'Do you want to exit the app?',
                  cancelButton: true,
                  buttonText: 'EXIT');
            })).then((value) {
          if (value) {
            SystemNavigator.pop();
          }
        });
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),

                // Preview Page Logo
                const Text(
                  'filsignlearn',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFCD1F)),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Preview Page sub logo
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Learn filipino sign language the right way.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFFAAAAAA)),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                ),

                // Get started button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const SignUpScreen();
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
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFFCD1F),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Already have an account button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const SignInScreen();
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
                        'ALREADY HAVE AN ACCOUNT',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFCD1F)),
                        textAlign: TextAlign.center,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Already have an account button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return GetUsernameScreen();
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
                        'GUEST',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFCD1F)),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
