import 'package:flutter/material.dart';

class PracticeMainScreen extends StatelessWidget {
  const PracticeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: const Center(child: Text('Welcome to the new screen!')),
    );
  }
}
