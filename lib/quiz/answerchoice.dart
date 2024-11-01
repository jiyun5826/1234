import 'package:flutter/material.dart';

class AnswerChoice extends StatelessWidget {
  const AnswerChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('answer choice page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('choose the answer'),
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => CameraPage1()),
                        // );
                        //어느 페이지로 연결될지 하면 됨
                      },
                      child: Text("plastic"),
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => CameraPage2()),
                        // );
                        //어느 페이지로 연결될지 하면 됨
                      },
                      child: Text("can"),
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
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => CameraPage2()),
                        // );
                        //어느 페이지로 연결될지 하면 됨
                      },
                      child: Text("paper"),
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
