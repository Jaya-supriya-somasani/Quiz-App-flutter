import 'package:flutter/material.dart';
import 'package:quiz/presentation/widgets/subject_card.dart';

import 'practice_main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 100,
                ),
                Text(
                  "Practice",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Pick A Subject To Practice",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                SubjectCard(
                  subject: "Chemistry",
                  topicsCount: "1/10 Topics",
                  questionCount: "25/34 Qs",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PracticeMainScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
