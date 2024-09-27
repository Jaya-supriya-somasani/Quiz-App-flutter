import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectCard extends StatelessWidget {
  final String subject;
  final String topicsCount;
  final String questionCount;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.topicsCount,
    required this.questionCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: Colors.transparent,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/subjects_bg.svg',
              fit: BoxFit.cover,
              height: 110,
              width: 175,
            ),
            SizedBox(
              height: 110,
              width: 175,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      subject,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(topicsCount),
                    const SizedBox(height: 5),
                    Text(questionCount),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
