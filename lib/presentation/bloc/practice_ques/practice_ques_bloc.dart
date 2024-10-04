import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_event.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_state.dart';

class PracticeQuesBloc extends Bloc<PracticeQuesEvent, GetPracticeQuesState> {
  final GetPracticeQuesUseCase _getPracticeQuesUseCase;
  int currentQuestion = 1;
  bool isAnswerSelected = false;
  String? selectedAnswer;
  dynamic practiceQuestions;

  PracticeQuesBloc(this._getPracticeQuesUseCase)
      : super(const GetPracticeQuesLoadingState()) {
    on<GetExamDetails>(onGetPracticeQues);
    on<SelectAnswer>(onSelectedAnswer);
    on<NavigateToQuestion>(onNavigateToQuestion);
  }

  void onGetPracticeQues(
      GetExamDetails event, Emitter<GetPracticeQuesState> emit) async {
    emit(const GetPracticeQuesLoadingState());
    final currentQuestion = event.getCurrentQuestion;

    try {
      practiceQuestions =
          await _getPracticeQuesUseCase.call(params: currentQuestion);
      emit(GetPracticeQuesLoadedState(practiceQuestions));
    } catch (e) {
      print("Error in PracticeQuesBloc: $e");
      emit(const GetPracticeQuesErrorState(null));
    }
  }

  void onSelectedAnswer(
      SelectAnswer event, Emitter<GetPracticeQuesState> emit) {
    selectedAnswer = event.isAnswerSelected;
    isAnswerSelected = true;
    emit(GetPracticeQuesLoadedState(practiceQuestions));
  }

  void onNavigateToQuestion(
      NavigateToQuestion event, Emitter<GetPracticeQuesState> emit) {
    currentQuestion = event.questionIndex;
    add(GetExamDetails(currentQuestion.toString()));
  }
}
