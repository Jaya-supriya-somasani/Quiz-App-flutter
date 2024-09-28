import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques_state.dart';
import 'package:quiz/utils/data_state.dart';

class PracticeQuesBloc extends Bloc<PracticeQuesEvent, GetPracticeQuesState> {
  final GetPracticeQuesUseCase _getPracticeQuesUseCase;

  PracticeQuesBloc(this._getPracticeQuesUseCase)
      : super(const GetPracticeQuesLoadingState()) {
    on<GetExamDetails>(onGetPracticeQues);
  }

  void onGetPracticeQues(
      GetExamDetails event, Emitter<GetPracticeQuesState> emit) async {
    emit(const GetPracticeQuesLoadingState());
    try {
      final dataState = await _getPracticeQuesUseCase();

      if (dataState is DataSuccessState) {
        print("Data received in BLoC: ${dataState.data}");
        emit(GetPracticeQuesLoadedState(dataState.data!));
      } else if (dataState is DataFailedState) {
        print("Error received in BLoC: ${dataState.error}");
        emit(GetPracticeQuesErrorState(dataState.error));
      }
    } catch (e) {
      print("Error in BLoC: $e");
      emit(const GetPracticeQuesErrorState(null));
    }
  }
}
