import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CameraRecognitionPage extends StatefulWidget {
  @override
  _CameraRecognitionPageState createState() => _CameraRecognitionPageState();
}

class _CameraRecognitionPageState extends State<CameraRecognitionPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  String _result = ""; // 모델 결과 표시

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
  }

  // 카메라 초기화
  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras!.first, // 후면 카메라 사용
      ResolutionPreset.high,
    );
    await _cameraController!.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  // Teachable Machine 모델 로드
  Future<void> _loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/model.tflite", // 모델 파일 경로
        labels: "assets/labels.txt", // 라벨 파일 경로
      );
      print("Model loaded: $res");
    } catch (e) {
      print("Failed to load model: $e");
    }
  }

  // 사진 찍고 모델 실행
  Future<void> _captureAndRunModel() async {
    if (!_cameraController!.value.isInitialized) return;

    try {
      // 사진 촬영
      final image = await _cameraController!.takePicture();
      print("Image captured: ${image.path}");

      // 모델 실행
      var recognitions = await Tflite.runModelOnImage(
        path: image.path, // 촬영된 이미지 경로
        numResults: 2, // 결과의 수
        threshold: 0.5, // 신뢰 임계값
        imageMean: 127.5,
        imageStd: 127.5,
      );

      // 결과 업데이트
      setState(() {
        _result = recognitions.toString();
      });
    } catch (e) {
      print("Error capturing or running model: $e");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Recognition'),
      ),
      body: _isCameraInitialized
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 700,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 6,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CameraPreview(_cameraController!),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Prediction Result: $_result',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _captureAndRunModel,
                      child: Text('Capture and Predict'),
                    ),
                  ],
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
