// answer_result.dart
import 'package:flutter/material.dart';
import 'package:project/page/camerapage2.dart';
// import 'package:project/quiz/answerchoice.dart'; // AnswerChoice 페이지 import

class AnswerResultPage extends StatelessWidget {
  final String selectedAnswer;
  final String recognizedAnswer;

  AnswerResultPage(
      {required this.selectedAnswer, required this.recognizedAnswer});

  // recognizedAnswer를 getter로 선언
  // String get recognizedAnswer => '0'; // 실제로는 값을 받아오는 로직이 필요

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

  String get enganswer {
    if (recognizedAnswer == '0') {
      return "paper";
    } else if (recognizedAnswer == '1') {
      return "plastic";
    } else if (recognizedAnswer == '2') {
      return "can";
    } else if (recognizedAnswer == '3') {
      return "general waste";
    } else {
      return "알 수 없음";
    }
  }

  String explanation(String answer) {
    switch (recognizedAnswer) {
      case "0":
        return "종이는 재활용이 비교적 용이한 자원으로, 신문, 책, 상자 등 대부분의 종이 제품은 재활용이 가능합니다. \n오염된 종이나 코팅된 종이는 재활용이 어려울 수 있으므로 깨끗한 종이만 분리배출하는 것이 중요합니다. \n재활용된 종이는 다시 종이로 변환되거나, 골판지, 화장지 등 다양한 제품으로 재사용됩니다. \n종이 재활용은 나무 자원을 절약하고, 에너지 사용을 줄이며 환경 보호에 기여합니다.";
      case "1":
        return "플라스틱은 종류가 다양하고, 재활용이 가능한 플라스틱과 그렇지 않은 플라스틱이 있습니다. \nPET, HDPE 등의 플라스틱은 재활용이 가능하지만, PVC나 폴리스티렌은 재활용이 어려워 환경오염을 일으킬 수 있습니다. \n플라스틱은 재활용 후 섬유, 포장재 등으로 변환되지만, 반복적인 재활용으로 품질이 떨어질 수 있습니다. \n따라서 플라스틱을 재활용하려면 철저한 분리배출과 오염 방지가 중요합니다.";
      case "2":
        return "캔, 특히 알루미늄 캔은 100% 재활용 가능하며, 재활용 후 품질 저하 없이 다시 새로운 캔으로 변환됩니다. \n알루미늄 캔을 재활용하면 원료 채굴로 인한 환경 부담을 줄이고, 에너지 소비를 절감할 수 있습니다. \n철 캔도 재활용이 가능하지만, 알루미늄보다는 재활용률이 낮습니다. \n캔은 재활용 과정에서 오염물질을 제거하고, 다시 사용 가능한 금속 자원으로 변환됩니다.";
      case "3":
        return "전 세계에서 매년 약 23억 톤의 쓰레기가 발생하며, 그 중 약 50%~70%는 일반쓰레기로 분류됩니다. \n일반쓰레기는 재활용이 어려운 혼합 폐기물로, 음식물 쓰레기나 오염된 포장재 등이 포함됩니다. \n이러한 쓰레기 대부분은 매립지에 버려지거나 소각 처리되며, 이는 심각한 대기오염을 유발합니다.";
      default:
        return "error?!?!?!?!";
    }
  }

  @override
  Widget build(BuildContext context) {
    // 예시에서는 "종이"가 정답
    bool isCorrect = selectedAnswer == recognizedAnswer;

    return Scaffold(
      appBar: AppBar(
        title: Text('정답 확인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isCorrect ? '정답입니다!' : '틀렸습니다!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (isCorrect)
              Column(
                children: [
                  // 로컬 이미지 예시
                  Image.asset('assets/images/${enganswer}.jpg',
                      width: 500, height: 250, fit: BoxFit.cover),
                ],
              ),
            SizedBox(height: 20),
            Text(
              isCorrect
                  ? '${answer}은(는) 정답입니다! \n${explanation(answer)}'
                  : '다시 시도해보세요!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // 틀렸을 때 '다시 시도' 버튼
            if (!isCorrect)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // AnswerChoice로 돌아가기
                },
                child: Text('다시 시도'),
              ),
            if (isCorrect)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage2(),
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
