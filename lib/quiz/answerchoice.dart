import 'package:flutter/material.dart';
import 'package:project/quiz/answeresult.dart';

class AnswerChoice extends StatelessWidget {
  final String result;

  const AnswerChoice({super.key, required this.result});

  void _navigateToAnswerResult(BuildContext context, String selectedAnswer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnswerResultPage(
            selectedAnswer: selectedAnswer, recognizedAnswer: result),
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
            // Text('Choose the answer'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 650,
                    height: 300,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '0');
                      },
                      child: Text(
                        "종이",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 650,
                    height: 300,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '1');
                      },
                      child: Text(
                        "플라스틱",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 650,
                    height: 300,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '2');
                      },
                      child: Text(
                        "캔",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 650,
                    height: 300,
                    child: FloatingActionButton(
                      onPressed: () {
                        _navigateToAnswerResult(context, '3');
                      },
                      child: Text(
                        "일반쓰레기",
                        style: TextStyle(fontSize: 50),
                      ),
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
