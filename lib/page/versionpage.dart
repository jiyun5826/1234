import 'package:flutter/material.dart';
import 'package:project/page/camerapage.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('version page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('choose the version'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CameraPage()),
                    );
                  },
                  child: Icon(Icons.person),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CameraPage()),
                    );
                  },
                  child: Icon(Icons.child_care),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
