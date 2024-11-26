import 'package:flutter/material.dart';
import 'package:project/page/camerapage1.dart';

class Open extends StatelessWidget {
  const Open({super.key});

  // recognizedAnswer를 getter로 선언
  String get recognizedAnswer => '0'; // 실제로는 값을 받아오는 로직이 필요

  // answer를 getter로 선언
  String get answer {
    if (recognizedAnswer == '0') {
      return "종이";
    } else if (recognizedAnswer == '1') {
      return "플라스틱";
    } else if (recognizedAnswer == '2') {
      return "캔";
    } else if (recognizedAnswer == '3') {
      return "일반쓰레기";
    } else {
      return "알 수 없음";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('쓰레기 종류'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "이 쓰레기는 ${answer}입니다.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPage1(),
                  ),
                );
              },
              child: Text('카메라로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}