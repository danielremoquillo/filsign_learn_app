import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {super.key,
      required this.buttonBackgroundColor,
      required this.buttonText,
      required this.popValue,
      required this.buttonTextColor,
      this.borderWidth});
  final Color buttonBackgroundColor;
  final String buttonText;
  final Color buttonTextColor;
  final bool popValue;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(popValue);
      },
      style: TextButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: borderWidth ?? 1),
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  letterSpacing: 0.2,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                buttonText,
                style: TextStyle(
                  letterSpacing: 0.2,
                  color: buttonTextColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
