import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/success_dialog.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/warning_dialog.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  late String _email;

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Sign in function with EMAIL AND PASSWORD
      _auth.resetPassword(_email).then((value) {
        if (value == 'success') {
          showDialog(
            context: context,
            builder: ((context) {
              return const SuccessDialog(
                title: 'SUCCESS',
                message: 'Password reset link sent. Check your inbox.',
                buttonText: 'CONFIRM',
              );
            }),
          );
        } else {
          showDialog(
            context: context,
            builder: ((context) {
              return WarningDialog(
                title: 'RESET FAILED',
                message: value,
                cancelButton: false,
                buttonText: 'OKAY',
              );
            }),
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
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
              padding:
                  const EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.20,
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
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFAAAAAA)),
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),

                        Row(
                          children: const [
                            Text(
                              'Reset password',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFAAAAAA)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Email Text Input
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 14.0, color: Color(0xFFAAAAAA)),
                          decoration: InputDecoration(
                            labelText: 'EMAIL',
                            contentPadding:
                                const EdgeInsets.only(left: 20, right: 20),
                            labelStyle: const TextStyle(
                                fontSize: 13.0, color: Color(0xFFC2C2C2)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFCD1F)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFCD1F)),
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
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        // SIGN IN button
                        TextButton(
                          onPressed: () => _resetPassword(),
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
                                'SEND',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // Sign in with google
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
