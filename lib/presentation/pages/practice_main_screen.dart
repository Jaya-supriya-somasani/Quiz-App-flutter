import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_state.dart';

class PracticeMainScreen extends StatefulWidget {
  const PracticeMainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PracticeMainScreen();
}

class _PracticeMainScreen extends State<PracticeMainScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PracticeQuesBloc>(context).add(const GetExamDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: _makeApiCall(),
    );
  }

  Widget _makeApiCall() {
    return BlocBuilder<PracticeQuesBloc, GetPracticeQuesState>(
      builder: (context, state) {
        if (state is GetPracticeQuesLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is GetPracticeQuesErrorState) {
          return Center(child: Text('Error: ${state.error?.message}'));
        }
        if (state is GetPracticeQuesLoadedState) {
          return ListView.builder(
            itemCount: state.practiceQuestions.optionList?.length ?? 0,
            itemBuilder: (context, index) {
             return Column(
               children: [
                 Row(
                   children: [
                     Text("Q${state.practiceQuestions.questionNumber}"),
                     Text("${state.practiceQuestions.questionType}")
                   ],
                 )
               ],
             );
              // return ListTile(
              //   title: Text(state.practiceQuestions.questionStatus.toString()),
              // );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
