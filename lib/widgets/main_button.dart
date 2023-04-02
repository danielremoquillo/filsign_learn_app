import 'package:flutter/material.dart';

class MainButtonChild extends StatelessWidget {
  const MainButtonChild({
    super.key,
    required this.buttonText,
    required this.buttonTextColor,
  });
  final String buttonText;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(
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
                color: buttonTextColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
