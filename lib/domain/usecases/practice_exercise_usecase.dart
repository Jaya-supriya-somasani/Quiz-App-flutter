import 'package:quiz/domain/entities/practice_exercise.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class GetPracticeExerciseUseCase
    implements UseCase<DataState<List<PracticeExerciseEntity>>, void> {
  final PracticeExerciseRepo _practiceExerciseRepo;

  const GetPracticeExerciseUseCase(this._practiceExerciseRepo);

  @override
  Future<DataState<List<PracticeExerciseEntity>>> call({void params}) {
    return _practiceExerciseRepo.getPracticeExerciseData();
  }
}