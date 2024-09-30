import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:quiz/domain/entities/practice_exercise.dart';

abstract class GetPracticeExerciseState extends Equatable {
  final PracticeExerciseEntity? practiceExerciseEntity;
  final DioException? error;

  const GetPracticeExerciseState({this.practiceExerciseEntity, this.error});

  @override
  List<Object?> get props => [practiceExerciseEntity, error];
}

class GetPracticeExerciseLoadingState extends GetPracticeExerciseState {
  const GetPracticeExerciseLoadingState();
}

class GetPracticeExerciseErrorState extends GetPracticeExerciseState {
  const GetPracticeExerciseErrorState(DioException? error) : super(error: error);
}

class GetPracticeExerciseLoadedState extends GetPracticeExerciseState {
  final List<PracticeExerciseEntity> exercises;

  const GetPracticeExerciseLoadedState(this.exercises);

  @override
  List<Object?> get props => [exercises];
}

