import 'package:dio/src/dio_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_state.dart';
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
      final data = await _getPracticeQuesUseCase.call();
      print("dsfjhsdgf - $data");
        emit(GetPracticeQuesLoadedState(data));
    } catch (e) {
      print("Error in BLoC: $e");
      emit(const GetPracticeQuesErrorState(null));
    }
  }
}
