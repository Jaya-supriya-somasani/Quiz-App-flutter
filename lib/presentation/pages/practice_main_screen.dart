import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques_state.dart';

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

  _makeApiCall() {
    print("Calling api");
    return BlocBuilder<PracticeQuesBloc, GetPracticeQuesState>(
        builder: (_, state) {
      if (state is GetPracticeQuesLoadedState) {
        print(" data-is-in ${state.practiceQuestions}");
        return ListView.builder(
          itemCount: state.practiceQuestions?.optionList?.length,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text("questionh88"),
            );
          },
        );
      }
      if (state is GetPracticeQuesErrorState) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is GetPracticeQuesLoadingState) {
        return const Center(child: CupertinoActivityIndicator());
      }
      return const SizedBox();
    });
  }
}
