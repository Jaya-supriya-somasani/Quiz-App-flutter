import 'package:quiz/utils/data_state.dart';

abstract class SubmitAnswersRepo{
  Future<DataState<dynamic>> submitAnswerData();
}