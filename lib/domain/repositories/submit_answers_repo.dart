import 'package:quiz/data/models/submit_answer_response.dart';
import 'package:quiz/utils/data_state.dart';

abstract class SubmitAnswersRepo{
  Future<DataState<SubmitAnswerResponse>> submitAnswerData();
}