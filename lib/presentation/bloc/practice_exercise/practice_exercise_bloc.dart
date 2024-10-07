import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/domain/usecases/practice_exercise_usecase.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_event.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_state.dart';

class PracticeExerciseBloc
    extends Bloc<PracticeExerciseEvent, GetPracticeExerciseState> {
  final GetPracticeExerciseUseCase _getPracticeExerciseUseCase;

  PracticeExerciseBloc(this._getPracticeExerciseUseCase)
      : super(const GetPracticeExerciseLoadingState()) {
    on<GetPracticeExerciseDetails>(_onGetPracticeExercise);
  }

  void _onGetPracticeExercise(
    GetPracticeExerciseDetails event,
    Emitter<GetPracticeExerciseState> emit,
  ) async {
    emit(const GetPracticeExerciseLoadingState());
    final data = await _getPracticeExerciseUseCase.call();
    try {
      emit(GetPracticeExerciseLoadedState(data));
    } catch (e) {
      print("Error in exercise BLoC: $e");
      emit(GetPracticeExerciseErrorState(
          e.toString())); // Provide a string error message
    }
  }
}
