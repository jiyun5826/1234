import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
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
            Text('click the camera button aaaaaaaaaaaaaa'),
            ButtonTheme(
                child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.camera_alt),
            ))
          ],
        ),
      ),
    );
  }
}
