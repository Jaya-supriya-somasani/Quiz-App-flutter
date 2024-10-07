import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/domain/usecases/submit_answers_usecase.dart';
import 'package:quiz/presentation/bloc/submit_answers/submit_answers_event.dart';
import 'package:quiz/presentation/bloc/submit_answers/submit_answers_state.dart';

class SubmitAnswersBloc extends Bloc<SubmitAnswersEvent, SubmitAnswersState> {
  final SubmitAnswersUseCase submitAnswersUseCase;

  SubmitAnswersBloc(this.submitAnswersUseCase)
      : super(SubmitAnswerLoadingState()) {
    on<PostSubmitAnswerDetails>(_onSubmitAnswer);
  }

  void _onSubmitAnswer(
    PostSubmitAnswerDetails event,
    Emitter<SubmitAnswersState> emit,
  ) async {
    emit(SubmitAnswerLoadingState());
    final data = await submitAnswersUseCase.call(params: event.submitExerciseAnswerRequest);
    try {
      emit(SubmitAnswerLoadedState(data));
    } catch (e) {
      emit(SubmitAnswerFailedState(e.toString()));
    }
  }
}
