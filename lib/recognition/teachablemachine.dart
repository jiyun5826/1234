import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CallTeachableMachine extends StatefulWidget {
  const CallTeachableMachine({super.key});

  @override
  State<CallTeachableMachine> createState() => CallTeachableMachineState();
}

class CallTeachableMachineState extends State<CallTeachableMachine> {
  String _result = "";

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  // Teachable Machine 모델 로드
  Future<void> loadModel() async {
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

  // 예측 함수 예제
  Future<void> runModelOnImage(String imagePath) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imagePath, // 이미지 파일 경로
      numResults: 2, // 반환할 결과의 수
      threshold: 0.5, // 신뢰 임계값
      imageMean: 127.5, // 이미지 전처리 평균
      imageStd: 127.5, // 이미지 전처리 표준 편차
    );
    setState(() {
      _result = recognitions.toString();
    });
  }

  @override
  void dispose() {
    Tflite.close(); // TFLite 리소스 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teachable Machine Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Prediction Result: $_result'),
            ElevatedButton(
              onPressed: () {
                // 예제 이미지 경로로 모델 실행
                runModelOnImage('path_to_image.jpg');
              },
              child: Text('Run Model on Image'),
            ),
          ],
        ),
      ),
    );
  }
}
