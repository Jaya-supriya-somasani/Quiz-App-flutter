import 'package:quiz/data/models/api_response.dart';
import 'package:quiz/utils/data_state.dart';

import '../entities/practice_exercise.dart';

abstract class PracticeExerciseRepo {
  Future<DataState<List<PracticeExerciseEntity>>> getPracticeExerciseData();
}
