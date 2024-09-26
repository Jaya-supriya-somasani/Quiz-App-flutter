import 'package:quiz/data/repositories/question_repository.dart';
import 'package:quiz/domain/entities/practice_ques_entity.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class GetPracticeQuesUseCase
    implements UseCase<DataState<List<PracticeQuesEntity>>, void> {
  final PracticeQuesRepository _practiceQuesRepository;

  const GetPracticeQuesUseCase(this._practiceQuesRepository);

  @override
  Future<DataState<List<PracticeQuesEntity>>> call({void params}) async {
    return _practiceQuesRepository.fetchQuestions();
  }
}
