import 'package:filsign_learn_app/services/auth_service.dart';
import 'package:filsign_learn_app/services/page_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  late String _email;
  late String _password;

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Do something with the form data, such as submitting it to a server
      _auth.registerWithEmailAndPassword(_email, _password).then((value) =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PageService();
          })));
    }
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
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
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFAAAAAA)),
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
                        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                      height: 10,
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
                      height: 15,
                    ),

                    TextFormField(
                      obscureText: !_showConfirmPassword,
                      style: const TextStyle(
                          fontSize: 14.0, color: Color(0xFFAAAAAA)),
                      decoration: InputDecoration(
                        labelText: 'CONFIRM PASSWORD',
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
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password doesn't match";
                        }
                        if (value != _password) {
                          return "Password doesn't match";
                        }

                        return null;
                      },
                      onSaved: (newValue) {},
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // SIGN IN button
                    TextButton(
                      onPressed: _submitForm,
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
                            'SIGN UP',
                            style: TextStyle(
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

                    // Sign in with google
                    TextButton(
                      onPressed: () {},
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: const Text(
                                  'SIGN UP WITH GOOGLE',
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
            ),
          ],
        ),
      )),
    );
  }
}
