import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/data/repositories/practice_exercise_repo_imp.dart';
import 'package:quiz/di.dart';
import 'package:quiz/domain/usecases/practice_exercise_usecase.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_bloc.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_event.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_state.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_bloc.dart';
import 'package:quiz/presentation/widgets/subject_card.dart';

import 'practice_main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late PracticeExerciseBloc _practiceExerciseBloc;

  @override
  void initState() {
    super.initState();
    _practiceExerciseBloc = PracticeExerciseBloc(
        GetPracticeExerciseUseCase(sl.get<PracticeExerciseRepoImp>()));
    _practiceExerciseBloc.add(GetPracticeExerciseDetails());
  }

  var completedQues = 0;

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
            Expanded(
              child: BlocProvider(
                create: (_) => _practiceExerciseBloc,
                child:
                    BlocBuilder<PracticeExerciseBloc, GetPracticeExerciseState>(
                  builder: (context, state) {
                    print(state);
                    if (state is GetPracticeExerciseLoadingState) {
                      print(state);
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetPracticeExerciseErrorState) {
                      print(state);
                      return Center(
                          child:
                              Text('Error: ${state.error ?? 'Unknown Error'}'));
                    } else if (state is GetPracticeExerciseLoadedState) {
                      return ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          final exercise = state.exercises[index];
                          completedQues = exercise.completedQuestion;

                          return ListTile(
                            title: Text(exercise.totalQuestions.toString()),
                            subtitle: Text(
                                'Topics: ${exercise.chapterName}, Questions: ${exercise.totalQuestions} completedQuestion :  ${exercise.completedQuestion}'),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No data available.'));
                    }
                  },
                ),
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
                    print("home- completed ques$completedQues");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => PracticeQuesBloc(
                            sl<GetPracticeQuesUseCase>(),
                          ),
                          child: PracticeMainScreen(completedQuestions: 5 ?? 0),
                        ),
                      ),
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
