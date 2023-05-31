import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:yuvtransform/yuvtransform.dart';

import '../../../main.dart';
import '../../../widgets/dialog_widgets/warning_dialog.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  final List<CameraDescription> _cameras = cameras;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late WebSocketChannel _channel;
  String serverResponse = '';
  int _camSwitch = 1;

  @override
  void initState() {
    super.initState();

    // Connect to the WebSocket server
    _connectToWebSocketServer();

    // Start the image stream automatically
    startImageStream();
  }

  @override
  void dispose() {
    // Dispose of the camera controller and image stream subscription when the widget is disposed
    // Dispose of the controller and WebSocket channel when the widget is disposed
    _controller.dispose();
    _channel.sink.close();
    stopImageStream();

    super.dispose();
  }

  void startImageStream() async {
    // Initialize the camera controller
    _controller = CameraController(
      _cameras[_camSwitch], // Use the first available camera
      ResolutionPreset.low,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();

    // Ensure that the camera is initialized
    await _initializeControllerFuture;

    // Start the image stream
    _controller.startImageStream((image) {
      // Process the image stream data here
      try {
        processCameraImage(image);
      } on Exception catch (e) {
        print(e.toString());
      }
    });
  }

  void _connectToWebSocketServer() {
    _channel = IOWebSocketChannel.connect('ws://192.168.100.8:8765');

    // Listen for WebSocket messages
    _channel.stream.listen((message) {
      if (message is Uint8List) {
      } else if (message is String) {
        setState(() {
          serverResponse = message;
        });
      }
    }, onError: (error) {
      print('WebSocket error: $error');
      // Handle WebSocket error
    }, onDone: () {
      print('WebSocket closed');
      // Handle WebSocket closure
    });
  }

  void stopImageStream() {
    // Stop the image stream
    _controller.stopImageStream();
  }

  void processCameraImage(CameraImage image) async {
    // Convert the CameraImage to bytes
    Uint8List bytes = await Yuvtransform.yuvTransform(image);

    final lengthBytes = Uint8List.fromList(bytes.length.toBytes());
    _channel.sink.add(lengthBytes);
    // Send the frame data to the WebSocket server
    _channel.sink.add(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                'Playground',
                style: TextStyle(
                  fontSize: 23,
                  letterSpacing: 0.3,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.8
                    ..color = Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Playground',
                style: TextStyle(
                  letterSpacing: 0.3,
                  fontSize: 23,
                  color: Color(0xFFFFCD1F),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
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
        child: SafeArea(
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the camera preview
                return Column(
                  children: [
                    CameraPreview(_controller),
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Predictions'),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                serverResponse,
                                style: TextStyle(
                                  fontSize: 23,
                                  letterSpacing: 0.3,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 0.8
                                    ..color = Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                serverResponse,
                                style: TextStyle(
                                  letterSpacing: 0.3,
                                  fontSize: 23,
                                  color: Color(0xFFFFCD1F),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.cameraswitch_outlined,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                // Initialize the camera controller
                                if (_camSwitch == 1) {
                                  _camSwitch = 0;
                                } else if (_camSwitch == 0) {
                                  _camSwitch = 1;
                                }

                                startImageStream();
                              });
                            },
                          ),
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
        ),
      ),
    );
  }
}

extension IntToBytes on int {
  List<int> toBytes() => [
        (this >> 24) & 0xff,
        (this >> 16) & 0xff,
        (this >> 8) & 0xff,
        this & 0xff
      ];
}
