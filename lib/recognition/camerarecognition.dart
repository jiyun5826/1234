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
                        borderRadius: BorderRadius.circular(20), // 둥근 모서리
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.3), // 그림자 색상 (여기선 투명한 검정색)
                            spreadRadius: 5, // 그림자의 확장 정도
                            blurRadius: 10, // 그림자 흐림 정도
                            offset: Offset(0, 4), // 그림자의 위치 (가로, 세로)
                          ),
                        ],
                      ),
                      // decoration: BoxDecoration(
                      //   color: Colors.black,
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CameraPreview(_cameraController!),
                      ),
                    ),
                    // AspectRatio(
                    //   aspectRatio: _cameraController!.value.aspectRatio,
                    //   child: CameraPreview(_cameraController!),
                    // ), 얘네를 container로 대체함

                    // ElevatedButton(
                    //   onPressed: () {
                    //     // 카메라 인식 기능을 추가하거나 사진을 찍는 기능을 구현할 수 있음
                    //   },
                    //   child: Text('Capture'),
                    // ),
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
