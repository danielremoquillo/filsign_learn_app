import 'package:filsign_learn_app/widgets/dialog_widgets/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});

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
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(border: Border.all()),
              ),
              Container(
                width: 50,
                height: 2,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 2,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
