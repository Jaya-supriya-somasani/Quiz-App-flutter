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
    final dataState = await _getPracticeQuesUseCase();
    print("data-state $dataState");
    if (dataState is DataSuccessState) {
      // Assuming it returns a single PracticeQuesEntity
      emit(GetPracticeQuesLoadedState(dataState.data!)); // Change to pass a single entity
    }
    if (dataState is DataFailedState) {
      emit(GetPracticeQuesErrorState(dataState.error));
    }
  }
}
