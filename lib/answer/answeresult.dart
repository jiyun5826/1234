// answer_result.dart
import 'package:flutter/material.dart';
import 'package:project/quiz/answerchoice.dart'; // AnswerChoice 페이지 import

class AnswerResultPage extends StatelessWidget {
  final String selectedAnswer;

  AnswerResultPage({required this.selectedAnswer});

  @override
  Widget build(BuildContext context) {
    // 예시에서는 "종이"가 정답
    bool isCorrect = selectedAnswer == '종이';

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
            Text(
              isCorrect ? '종이는 재활용 가능한 자원입니다.' : '정답은 종이였습니다. 다시 시도해보세요!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // 틀렸을 때 '다시 시도' 버튼
            if (!isCorrect)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnswerChoice(),
                    ),
                  );
                },
                child: Text('다시 시도'),
              ),
          ],
        ),
      ),
    );
  }
}
