import 'package:flutter/material.dart';
import 'package:project/page/versionpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'smart trash can',
      home: const VersionPage(),
    );
  }
}
