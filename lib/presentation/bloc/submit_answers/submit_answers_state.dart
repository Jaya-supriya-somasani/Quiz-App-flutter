import 'package:equatable/equatable.dart';
import 'package:quiz/data/models/submit_answer_response.dart';

abstract class SubmitAnswersState extends Equatable{
  final SubmitAnswerResponse? submitAnswerResponse;
  final String? error;
  const SubmitAnswersState({this.submitAnswerResponse,this.error});


  @override
  List<Object?> get props => [submitAnswerResponse, error];
}

class SubmitAnswerLoadingState extends SubmitAnswersState{}
class SubmitAnswerLoadedState extends SubmitAnswersState{
  final dynamic submittedAnswerData;
  const SubmitAnswerLoadedState(this.submittedAnswerData);
}
class SubmitAnswerFailedState extends SubmitAnswersState{
  const SubmitAnswerFailedState(String? error):super(error: error);
}