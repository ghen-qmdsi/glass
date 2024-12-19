import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'take_picture_screen.dart'; // Import the new file

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()` can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        camera: firstCamera, // Pass the camera to the TakePictureScreen widget
      ),
    ),
  );
}
