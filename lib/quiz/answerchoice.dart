// answer_choice.dart
import 'package:flutter/material.dart';
import 'package:project/answer/answeresult.dart'; // AnswerResultPage를 import

class AnswerChoice extends StatelessWidget {
  const AnswerChoice({super.key});

  void _navigateToAnswerResult(BuildContext context, String selectedAnswer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnswerResultPage(selectedAnswer: selectedAnswer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Answer Choice Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose the answer'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '종이');
                      },
                      child: Text("종이"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '플라스틱');
                      },
                      child: Text("플라스틱"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '캔');
                      },
                      child: Text("캔"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '일반쓰레기');
                      },
                      child: Text("일반쓰레기"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
