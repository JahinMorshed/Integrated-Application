import 'package:flutter/material.dart';
import 'package:my_portfolio/quiz/QuizScreen.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text('Third Page'),
      // ),
      body: QuizScreen(),
    );
  }
}