import 'package:quiz/data/models/api_response.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

import '../entities/practice_exercise.dart';

class GetPracticeExerciseUseCase
    implements UseCase<List<PracticeExerciseEntity>, void> {
  final PracticeExerciseRepo _practiceExerciseRepo;

  const GetPracticeExerciseUseCase(this._practiceExerciseRepo);

  @override
  Future<List<PracticeExerciseEntity>> call({void params}) async{
    final data =await _practiceExerciseRepo.getPracticeExerciseData();
    if (data is DataSuccessState<PracticeExerciseModelResponse>) {
      final listData = data.data.data;
      return listData;
    } else {
      throw Exception("Error in Usecase Exercises");
    }
  }
}