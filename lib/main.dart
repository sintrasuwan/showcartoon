import 'package:showcartoon/pages/menupage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartoons List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: menupage(),
    );
  }
}//ชนกัณต์ อินทรสุวรรณ์ 640710502 ขอเปลี่ยนชื่อไฟล์เนื่องจากมีปัญหาตอนลงGithub