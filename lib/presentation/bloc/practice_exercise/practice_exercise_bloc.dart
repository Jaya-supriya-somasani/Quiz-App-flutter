import 'package:dio/src/dio_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/data/models/api_response.dart';
import 'package:quiz/domain/entities/practice_exercise.dart';
import 'package:quiz/domain/usecases/practice_exercise_usecase.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_event.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_state.dart';
import 'package:quiz/utils/data_state.dart';

class PracticeExerciseBloc
    extends Bloc<PracticeExerciseEvent, GetPracticeExerciseState> {
  final GetPracticeExerciseUseCase _getPracticeExerciseUseCase;

  PracticeExerciseBloc(this._getPracticeExerciseUseCase)
      : super(const GetPracticeExerciseLoadingState()) {
    on<GetPracticeExerciseDetails>(onGetPracticeExercise);
  }

  void onGetPracticeExercise(
      GetPracticeExerciseDetails event,
      Emitter<GetPracticeExerciseState> emit,) async {
    emit(const GetPracticeExerciseLoadingState());
    final dataState = await _getPracticeExerciseUseCase();
    print('jdhfdkjs - $dataState');
    try {

      print('API-call-state, details: $dataState--${dataState.data}');

      if (dataState is DataSuccessState<List<PracticeExerciseEntity>>) {
        emit(GetPracticeExerciseLoadedState(dataState.data!));
      } else if (dataState is DataFailedState) {
        emit(GetPracticeExerciseErrorState(dataState.error));
      }
    } catch (e) {
      print("Error in BLoC: $e");
      emit(GetPracticeExerciseErrorState(e.toString())); // Provide a string error message
    }
  }
}
