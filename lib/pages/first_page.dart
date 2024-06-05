import 'package:flutter/material.dart';
import 'package:my_portfolio/calcutatior/scientificCalculator.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: ScientificCalculator(),
        // child: Text('This is the First page'),
      
    );
  }
}