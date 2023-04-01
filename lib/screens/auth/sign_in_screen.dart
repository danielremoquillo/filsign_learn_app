import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:filsign_learn_app/widgets/confirm_dialog.dart';
import 'package:filsign_learn_app/widgets/warning_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSigningIn = false;

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  late String _email;
  late String _password;
  bool _showPassword = false;

  void _signInWithEmail() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isSigningIn = !isSigningIn;
      });

      // Sign in function with EMAIL AND PASSWORD
      _auth.signInWithEmailAndPassword(_email, _password).then((value) {
        setState(() {
          isSigningIn = !isSigningIn;
        });
        if (value == 'success') {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) {
                return const PageService();
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
            (route) => false,
          );
        } else {
          showDialog(
              context: context,
              builder: ((context) {
                return WarningDialog(
                    title: 'SIGN IN FAILED',
                    message: value.replaceFirst(RegExp(r'\[.*?\]\s*'), ''));
              }));
        }
      });
    }
  }

  void _signInWithGoogle() {
    _auth.signInWithGoogle().then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PageService();
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
        (route) => false,
      );
    });
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
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
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
                          height: 5,
                        ),
                        // Password Text Input
                        TextFormField(
                          obscureText: !_showPassword,
                          style: const TextStyle(
                              fontSize: 14.0, color: Color(0xFFAAAAAA)),
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFFC2C2C2),
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }

                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        //Forgot password
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                  text: 'Forgot Password?',
                                  style: const TextStyle(
                                      fontSize: 12.0, color: Color(0xFFAAAAAA)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // SIGN IN button
                        TextButton(
                          onPressed: () {
                            !isSigningIn ? _signInWithEmail() : null;
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: !isSigningIn
                                  ? const Color(0xFFFFCD1F)
                                  : const Color.fromARGB(240, 255, 224, 113),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                !isSigningIn ? 'SIGN IN' : 'SIGNING IN...',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //Divider between sign in with google
                        Row(
                          children: const [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Color.fromARGB(255, 218, 218, 218),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'OR WITH',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Color.fromARGB(255, 218, 218, 218),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  // Sign in with google
                  TextButton(
                    onPressed: () => _signInWithGoogle(),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Color(0xFFE7D6D6)),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Image.asset('assets/images/google_icon.png'),
                        ),
                        Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                'SIGN IN WITH GOOGLE',
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
              ),
            ),
          ],
        ),
      )),
    );
  }
}
