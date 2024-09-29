import 'package:quiz/domain/entities/practice_exercise.dart';
import 'package:quiz/utils/data_state.dart';

abstract class PracticeExerciseRepo {
  Future<DataState<List<PracticeExerciseEntity>>> getPracticeExerciseData();
}
