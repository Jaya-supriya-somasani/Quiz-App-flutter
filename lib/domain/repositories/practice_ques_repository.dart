import 'package:quiz/data/models/practice_ques_model.dart';

abstract class PracticeQuesRepository{
  Future<List<PracticeQuesModel>> getPracticeQuestions();
}