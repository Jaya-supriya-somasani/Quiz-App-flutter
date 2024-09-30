import 'package:quiz/data/models/api_response.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

import '../entities/practice_exercise.dart';

class GetPracticeExerciseUseCase
    implements UseCase<DataState<List<PracticeExerciseEntity>>, void> {
  final PracticeExerciseRepo _practiceExerciseRepo;

  const GetPracticeExerciseUseCase(this._practiceExerciseRepo);

  @override
  Future<DataState<List<PracticeExerciseEntity>>> call({void params}) async{
    final data =await _practiceExerciseRepo.getPracticeExerciseData();
    print("usecase-data $data");
    return data;
  }
}