import 'package:flutter/material.dart';
import 'package:project/recognition/camerarecognition.dart';

class CameraPage2 extends StatefulWidget {
  const CameraPage2({super.key});

  @override
  State<CameraPage2> createState() => CameraPage2State();
}

class CameraPage2State extends State<CameraPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('camera page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('click the camera button'),
            ButtonTheme(
                child: Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                width: 150,
                height: 150,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CameraRecognitionPage()),
                    );
                  },
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
