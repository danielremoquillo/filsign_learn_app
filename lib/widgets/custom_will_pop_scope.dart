import 'package:flutter/material.dart';

class CustomWillPopScope extends StatelessWidget {
  final Widget child;
  final Future<bool> Function() onWillPop;

  CustomWillPopScope({required this.child, required this.onWillPop});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: child,
    );
  }
}
