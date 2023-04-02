import 'package:filsign_learn_app/widgets/dialog_widgets/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Image.asset('assets/images/success_dialog.png',
          fit: BoxFit.contain, width: 200, height: 100),
      shape: const RoundedRectangleBorder(
          side: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      actionsAlignment: MainAxisAlignment.center,
      contentPadding:
          const EdgeInsets.only(bottom: 4, left: 16, right: 16, top: 16),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 20.0,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              top: 0, bottom: 18.0, left: 18.0, right: 18.0),
          child: Column(
            children: [
              DialogButton(
                  buttonBackgroundColor: const Color(0xFF01CF8E),
                  buttonText: buttonText,
                  buttonTextColor: Colors.white,
                  popValue: true),
            ],
          ),
        ),
      ],
    );
  }
}
