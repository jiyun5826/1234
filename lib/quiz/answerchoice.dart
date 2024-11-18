// answer_choice.dart
import 'package:flutter/material.dart';
import 'package:project/quiz/answeresult.dart'; // AnswerResultPage를 import

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
                        _navigateToAnswerResult(context, '0');
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
                        _navigateToAnswerResult(context, '1');
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
                        _navigateToAnswerResult(context, '2');
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
                        _navigateToAnswerResult(context, '3');
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
