import 'package:quiz/domain/entities/practice_ques_entity.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class GetPracticeQuesUseCase
    implements UseCase<PracticeQuesEntity, void> {
  final PracticeQuesRepository _practiceQuesRepository;

  const GetPracticeQuesUseCase(this._practiceQuesRepository);

  @override
  Future<PracticeQuesEntity> call({void params}) async {
    final data = await _practiceQuesRepository.getPracticeQuestions();
    if (data is DataSuccessState<PracticeQuesEntity>) {
      return data.data;
    } else {
      throw Exception("Error in Usecase Exercises");
    }
  }
}
