import 'package:flutter/material.dart';
import 'package:project/page/VersionPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //앱 초기화
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
