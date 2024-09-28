import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:quiz/domain/entities/practice_ques_entity.dart';

abstract class GetPracticeQuesState extends Equatable {
  final PracticeQuesEntity? practiceQuestions;
  final DioError? error;

  const GetPracticeQuesState({this.practiceQuestions, this.error});

  @override
  List<Object?> get props => [practiceQuestions, error];
}

class GetPracticeQuesLoadingState extends GetPracticeQuesState {
  const GetPracticeQuesLoadingState();
}

class GetPracticeQuesErrorState extends GetPracticeQuesState {
  const GetPracticeQuesErrorState(DioError? error) : super(error: error);
}

class GetPracticeQuesLoadedState extends GetPracticeQuesState {
  final List<PracticeQuesEntity> questions;

  const GetPracticeQuesLoadedState(this.questions);
}