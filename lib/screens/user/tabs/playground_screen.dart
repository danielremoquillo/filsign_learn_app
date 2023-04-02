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
        child: Container(
          height: 100.0,
          child: Stack(
            children: [
              Container(
                height: 10.0,
                color: Colors.white,
              ),
              Positioned(
                left: 10.0,
                right: 10.0,
                top: 0.0,
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text('Custom Border'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
