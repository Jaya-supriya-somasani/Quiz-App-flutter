import 'package:quiz/domain/entities/practice_ques_entity.dart';
import 'package:quiz/utils/data_state.dart';

abstract class PracticeQuesRepository {
  Future<DataState<PracticeQuesEntity>> getPracticeQuestions();
}