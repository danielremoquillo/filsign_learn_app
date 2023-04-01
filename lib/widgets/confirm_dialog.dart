import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? note;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    this.note,
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
          Text(
            message,
            style: const TextStyle(
              color: Colors.grey,
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
                    backgroundColor: const Color(0xFFFFCD1F),
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)))),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'PROCEED',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
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
                      'CANCEL',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFCD1F)),
                      textAlign: TextAlign.center,
                    )),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
