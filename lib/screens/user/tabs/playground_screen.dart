import 'package:flutter/material.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
