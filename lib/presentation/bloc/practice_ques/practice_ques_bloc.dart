import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_state.dart';

class PracticeQuesBloc extends Bloc<PracticeQuesEvent, GetPracticeQuesState> {
  final GetPracticeQuesUseCase _getPracticeQuesUseCase;

  PracticeQuesBloc(this._getPracticeQuesUseCase)
      : super(const GetPracticeQuesLoadingState()) {
    on<GetExamDetails>(onGetPracticeQues);
  }

  void onGetPracticeQues(GetExamDetails event, Emitter<GetPracticeQuesState> emit) async {
    emit(const GetPracticeQuesLoadingState());
    final currentQuestion = event.getCurrentQuestion;
    print("current_question ques in BLoC${currentQuestion.runtimeType}");
    print('jhghjgjh - $currentQuestion');
    final data = await _getPracticeQuesUseCase.call(params: currentQuestion);

    try {
      if (currentQuestion == null) {
        throw Exception("Current question must not be null");
      }
      print("dsfjhsdgf - $data");
      emit(GetPracticeQuesLoadedState(data));
    } catch (e) {
      print("Error in ques BLoC: $e");
      emit(const GetPracticeQuesErrorState(null));
    }
  }
}
