import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:project/quiz/answerchoice.dart';

class CameraRecognitionPage2 extends StatefulWidget {
  const CameraRecognitionPage2({super.key});

  @override
  CameraRecognitionPage2State createState() => CameraRecognitionPage2State();
}

class CameraRecognitionPage2State extends State<CameraRecognitionPage2> {
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
        path: image.path,
        numResults: 2,
        threshold: 0.5,
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
                    ElevatedButton(
                      onPressed: () async {
                        await _captureAndRunModel(); // 사진 촬영 및 모델 실행
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnswerChoice(result: _result),
                          ),
                        );
                      },
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

// // ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
// // ignore: avoid_web_libraries_in_flutter
// import 'dart:js' as js;
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// import 'package:flutter/material.dart';
// import 'package:project/quiz/answerchoice.dart';

// class CameraRecognitionPage2 extends StatefulWidget {
//   const CameraRecognitionPage2({super.key});

//   @override
//   State<CameraRecognitionPage2> createState() => _CameraRecognitionPage2State();
// }

// class _CameraRecognitionPage2State extends State<CameraRecognitionPage2> {
//   late html.VideoElement _videoElement;
//   late html.CanvasElement _canvasElement;
//   String _result = "No Prediction";

//   @override
//   void initState() {
//     super.initState();
//     //웹캠 초기화
//     _initializeWebcam();
//     //플랫폼 뷰 등록
//     // _registerVideoElement();
//   }

//   void _initializeWebcam() {
//     _videoElement = html.VideoElement()
//       ..autoplay = true
//       ..style.width = '700px'
//       ..style.height = '400px';

//     html.window.navigator.mediaDevices
//         ?.getUserMedia({'video': true}).then((stream) {
//       _videoElement.srcObject = stream;
//     }).catchError((error) {
//       print("Error accessing webcam: $error");
//     });

//     _canvasElement = html.CanvasElement();
//   }

//   // void _registerVideoElement() {
//   //   // 플러그인 등록 (뷰 타입 정의)
//   //   const String viewType = 'videoElement';
//   //   html.document.body?.append(_videoElement);
//   //   // 플랫폼 뷰를 등록
//   //   registerViewFactory(
//   //     viewType,
//   //     (int viewId) => _videoElement,
//   //   );
//   // }    ㅅㅂ 여기가 문제임!!!!

//   Future<void> _captureAndPredict() async {
//     final context = _canvasElement.context2D;
//     _canvasElement.width = _videoElement.videoWidth.toInt();
//     _canvasElement.height = _videoElement.videoHeight.toInt();

//     // 현재 프레임을 캡처하여 Canvas에 그리기
//     context.drawImage(_videoElement, 0, 0);

//     // Canvas 데이터를 데이터 URL로 변환
//     final imageDataUrl = _canvasElement.toDataUrl();

//     // JavaScript predictImage 호출
//     final result = js.context.callMethod('predictImage', [imageDataUrl]);

//     setState(() {
//       _result = result.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Camera Recognition with Teachable Machine"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // 웹캠 스트림 표시
//           Expanded(
//             child: HtmlElementView(viewType: 'videoElement'),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             "Prediction Result:",
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             _result,
//             style: const TextStyle(fontSize: 16, color: Colors.blue),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               _captureAndPredict(); // 캡처 및 예측 함수 실행
//               Navigator.push(
//                 context, // 현재 BuildContext 사용
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       AnswerChoice(result: _result), // 새로운 페이지로 이동
//                 ),
//               );
//             },
//             child: const Text("Capture and Predict"),
//           ),
//         ],
//       ),
//     );
//   }
// }
