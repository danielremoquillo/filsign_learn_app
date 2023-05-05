import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'package:image/image.dart' as imager;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/dialog_widgets/warning_dialog.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription> cameras;

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late StreamSubscription<CameraImage> _subscription;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller
    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();

    // Start the image stream from the camera preview
    _subscription = _controller.startImageStream((CameraImage image) {
      // Convert the YUV420 image to a JPEG image
      final bytes = convertYUV420toJPEG(
          image.planes.map((plane) => plane.bytes).toList(),
          image.width,
          image.height);
      // Send the JPEG image to a server
      sendImage(bytes);
    });
  }

  @override
  void dispose() {
    // Dispose of the camera controller and image stream subscription when the widget is disposed
    _controller.dispose();
    _subscription.cancel();
    super.dispose();
  }

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
      child: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the camera controller has finished initializing, display the camera preview
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CameraPreview(_controller),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        child: Text(
                          'Predictions',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Lola',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFCD1F),
                              fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading spinner
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
