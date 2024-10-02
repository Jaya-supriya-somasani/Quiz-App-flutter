import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_state.dart';

class PracticeMainScreen extends StatefulWidget {
  const PracticeMainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PracticeMainScreen();
}

class _PracticeMainScreen extends State<PracticeMainScreen> {
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PracticeQuesBloc>(context).add(const GetExamDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createHeaderSection(),
    );
  }

  Widget _createHeaderSection() {
    return Column(
      children: [
        const SizedBox(height: 40),
        _makeApiCall(),
      ],
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
          print("questionData---${state.practiceQuestions.questionData}");

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Q ${state.practiceQuestions.questionNumber}/13"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.practiceQuestions.questionType} ${state.practiceQuestions.questionStatus}",
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: SvgPicture.asset(
                              'assets/x_close.svg',
                              fit: BoxFit.cover,
                              height: 25,
                            ),
                          ),
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
                        final optionHtml = state.practiceQuestions.optionList![index];

                        if (optionHtml.optionId == null) {
                          return const SizedBox();
                        }

                        return RadioListTile<String>(
                          title: Html(
                            data: optionHtml.optionData, // Render the option HTML
                            style: {
                              "p": Style(
                                margin: Margins.zero,
                              ),
                            },
                          ),
                          value: optionHtml.optionId!,
                          groupValue: _selectedAnswer,
                          onChanged: (value) {
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
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}