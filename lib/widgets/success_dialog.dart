import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? note;
  final String buttonName;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.message,
    this.note,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Lottie.asset('assets/lottie/benefit1.json',
          fit: BoxFit.contain, width: 400, height: 200),
      shape: const RoundedRectangleBorder(
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
          Text(
            note ?? '',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              top: 0, bottom: 18.0, left: 18.0, right: 18.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF6cc070),
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      buttonName,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
