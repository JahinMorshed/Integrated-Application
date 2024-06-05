import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/first_page.dart';
import 'package:my_portfolio/pages/fourth_page.dart';
import 'package:my_portfolio/pages/second_page.dart';
import 'package:my_portfolio/pages/third_page.dart';

class AnotherSection extends StatelessWidget {
  const AnotherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      // height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 80.0,
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                  );
                },
                child: const Text(
                  'Calculator',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text(
                  'Weather',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdPage()),
                  );
                },
                child: const Text(
                  'Quiz App',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FourthPage()),
                  );
                },
                child: const Text(
                  'Upload CV',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
