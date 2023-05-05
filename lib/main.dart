import 'dart:io';
import 'dart:typed_data';

import 'package:filsign_learn_app/services/page_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as imager;

List<CameraDescription> cameras = [];
var socket = null;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  const serverAddr = '192.168.100.8';
  const serverPort = 12345;
  final socket = await Socket.connect(serverAddr, serverPort);
  final camera = cameras[1];
  final controller = CameraController(camera, ResolutionPreset.low);
  await controller.initialize();

  //Splash Screen Timeout
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  await Firebase.initializeApp();

  runApp(
    const MyApp(),
  );

  // Loop indefinitely to capture and send video frames
  while (true) {
    // Capture frame from camera
    try {
      final frame = await captureFrame(controller);

      // Send frame data length to server
      final lengthBytes = Uint8List.fromList(frame.length.toBytes());
      socket.add(lengthBytes);

      // Send frame data to server
      socket.add(frame);
    } catch (e) {
      print('tite');
      break;
    }
  }

  // Close socket connection
  socket.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filsignlearn App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.orange,
          fontFamily: 'Fredoka'),
      home: PageService(
        cameras: cameras,
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

Future<Uint8List> captureFrame(CameraController controller) async {
  // Capture a frame from the camera
  final image = await controller.takePicture();

  // Convert the frame to a JPEG
  final bytes = await image.readAsBytes();
  final img = imager.decodeImage(bytes);
  final jpeg = imager.encodeJpg(img!);

  // Return the JPEG as a Uint8List
  return Uint8List.fromList(jpeg);
}
