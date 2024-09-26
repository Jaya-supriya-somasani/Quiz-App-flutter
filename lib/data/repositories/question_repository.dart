import 'package:quiz/data/models/practice_ques_model.dart';
import 'package:quiz/utils/data_state.dart';

abstract class PracticeQuesRepository{
  Future<DataState<List<PracticeQuesModel>>> fetchQuestions();
}