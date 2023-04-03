import 'package:filsign_learn_app/screens/user/main_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';

class BenefitPreview extends StatelessWidget {
  const BenefitPreview(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle});
  final String imageUrl;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl, fit: BoxFit.contain, width: 350, height: 175),
            const SizedBox(
              height: 60,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      )),
    );
  }
}
