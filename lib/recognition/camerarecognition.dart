import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraRecognitionPage extends StatefulWidget {
  @override
  _CameraRecognitionPageState createState() => _CameraRecognitionPageState();
}

class _CameraRecognitionPageState extends State<CameraRecognitionPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // 사용 가능한 카메라 목록을 가져옴
    _cameras = await availableCameras();

    // 후면 카메라를 기본으로 설정
    _cameraController = CameraController(
      _cameras!.first,
      ResolutionPreset.high,
    );

    // 카메라 초기화
    await _cameraController!.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Recognition'),
      ),
      body: _isCameraInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: _cameraController!.value.aspectRatio,
                  child: CameraPreview(_cameraController!),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // 카메라 인식 기능을 추가하거나 사진을 찍는 기능을 구현할 수 있음
                //   },
                //   child: Text('Capture'),
                // ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
