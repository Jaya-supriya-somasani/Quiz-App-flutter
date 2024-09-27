import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques_state.dart';

class PracticeMainScreen extends StatelessWidget {
  const PracticeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: _makeApiCall(),
    );
  }

  _makeApiCall() {
    return BlocBuilder<PracticeQuesBloc, GetPracticeQuesState>(
        builder: (_, state) {
          if (state is GetPracticeQuesLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is GetPracticeQuesErrorState) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is GetPracticeQuesLoadedState) {
            print(" data-is-in ${state.practiceQuestions}");
            return const Text("Data is successfully loaded");
          }
          return const SizedBox();
        });
  }
}