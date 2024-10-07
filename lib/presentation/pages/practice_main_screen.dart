import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quiz/data/models/submit_answers_request.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_state.dart';
import 'package:quiz/presentation/bloc/submit_answers/submit_answer_bloc.dart';
import 'package:quiz/presentation/bloc/submit_answers/submit_answers_event.dart';
import 'package:quiz/utils/constants.dart';

class PracticeMainScreen extends StatefulWidget {
  const PracticeMainScreen({super.key, required this.completedQuestions});

  final int? completedQuestions;

  @override
  State<StatefulWidget> createState() => _PracticeMainScreen();
}

class _PracticeMainScreen extends State<PracticeMainScreen> {
  String? _selectedAnswer;
  late String currentQuestion;

  @override
  void initState() {
    super.initState();
    currentQuestion = (widget.completedQuestions! + 1).toString();
    _fetchQuestionNumber(currentQuestion);
  }

  void _fetchQuestionNumber(String questionNumber) {
    BlocProvider.of<PracticeQuesBloc>(context)
        .add(GetExamDetails(currentQuestion));
  }

  void _postAnswers(SubmitExerciseAnswerRequest submitAnswerReq) {
    BlocProvider.of<SubmitAnswersBloc>(context)
        .add(PostSubmitAnswerDetails(submitAnswerReq));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: _makeApiCall(),
          ),
          _buildBottomButtons(),
        ],
      ),
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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Q $currentQuestion/13"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${state.practiceQuestions.questionType} ${state.practiceQuestions.questionStatus}",
                      ),
                      GestureDetector(
                        child: SvgPicture.asset(
                          'assets/x_close.svg',
                          fit: BoxFit.cover,
                          height: 25,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Html(
                    data: state.practiceQuestions.questionData,
                    style: {
                      "p": Style(
                        fontSize: FontSize(16),
                        margin: Margins.zero,
                      ),
                    },
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.practiceQuestions.optionList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final optionHtml =
                          state.practiceQuestions.optionList![index];

                      if (optionHtml.optionId == null) {
                        return const SizedBox();
                      }

                      return RadioListTile<String>(
                        title: Html(
                          data: optionHtml.optionData,
                          style: {
                            "p": Style(
                              margin: Margins.zero,
                            ),
                          },
                        ),
                        value: optionHtml.optionId!,
                        groupValue: _selectedAnswer,
                        onChanged: (value) {
                          BlocProvider.of<PracticeQuesBloc>(context)
                              .add(SelectAnswer(value!));
                          setState(() {
                            _selectedAnswer = value;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildBottomButtons() {
    return BlocBuilder<PracticeQuesBloc, GetPracticeQuesState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  currentQuestion = (int.parse(currentQuestion) - 1).toString();
                  setState(() {
                    _selectedAnswer = null;
                  });
                  BlocProvider.of<PracticeQuesBloc>(context)
                      .add(NavigateToQuestion(
                    questionIndex: int.parse(currentQuestion) - 1,
                  ));
                },
                child: const Text("Previous"),
              ),
              FilledButton(
                onPressed: () {
                  currentQuestion = (int.parse(currentQuestion) + 1).toString();

                  String answerState =
                      _selectedAnswer != null ? "answered" : "skipped";
                  final submitAnswerReq = SubmitExerciseAnswerRequest(
                    answerState: answerState,
                    answerText: _selectedAnswer,
                    chapterId: state.practiceQuestions?.chapterId ?? chapterId,
                    // pcsctId: "pcsctid",
                    itemUri: state.practiceQuestions?.itemUri ??
                        "http://tao.gcf.education/gcf.rdf#i15913411732818637070",
                    // noOfInteractions: 10,
                    practiceFormatId: "Ip4DogGnp1",
                    practiceType:
                        state.practiceQuestions?.practiceType ?? "chapter",
                    programId:
                        state.practiceQuestions?.programId ?? "mqJS5bOXgz",
                    questionId:
                        state.practiceQuestions?.questionId ?? "CYTBRhNHD2",
                    questionNumber:
                        state.practiceQuestions?.questionNumber ?? "3",
                    questionType: state.practiceQuestions?.questionType ??
                        "Single select",
                    responseId:
                        state.practiceQuestions?.responseId ?? "RESPONSE",
                    // result: "correct",
                    subjectId:
                        state.practiceQuestions?.subjectId ?? "subjectid",
                    timeTaken: 4032,
                    // topicId: topicID
                  );
                  if (_selectedAnswer != null) {
                    print("call-post--api submitAnswerReq----$submitAnswerReq");
                    _postAnswers(submitAnswerReq);
                  }
                  setState(() {
                    _selectedAnswer = null;
                  });

                  BlocProvider.of<PracticeQuesBloc>(context)
                      .add(NavigateToQuestion(
                    questionIndex: int.parse(currentQuestion) + 1,
                  ));
                },
                child: Text(
                  _selectedAnswer != null ? "Next" : "Skip",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
