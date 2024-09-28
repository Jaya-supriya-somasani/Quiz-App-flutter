import 'package:quiz/domain/entities/practice_ques_entity.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class GetPracticeQuesUseCase
    implements UseCase<DataState<List<PracticeQuesEntity>>, void> {
  final PracticeQuesRepository _practiceQuesRepository;

  const GetPracticeQuesUseCase(this._practiceQuesRepository);

  @override
  Future<DataState<List<PracticeQuesEntity>>> call({void params}) async {
    final data = await _practiceQuesRepository.getPracticeQuestions(); // Await the Future
    print("Got questions");

    if (data is DataSuccessState<List<PracticeQuesEntity>>) {
      print("Questions: ${data.data}");
    } else if (data is DataFailedState) {
      print("Error: ${data.error}");
    }

    print("@@@@@@");
    return data; // Return the resolved data
  }
}
