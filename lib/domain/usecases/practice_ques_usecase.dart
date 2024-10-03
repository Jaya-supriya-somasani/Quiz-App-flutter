import 'package:quiz/domain/entities/practice_ques_entity.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class GetPracticeQuesUseCase implements UseCase<PracticeQuesEntity, String> {
  final PracticeQuesRepository _practiceQuesRepository;

  const GetPracticeQuesUseCase(this._practiceQuesRepository);

  @override
  Future<PracticeQuesEntity> call({required String params}) async {
    print("Parameter type: ${params.runtimeType}");

    // Pass the questionNumber directly as it is already an int
    final data = await _practiceQuesRepository.getPracticeQuestions(questionNumber: params);
    if (data is DataSuccessState<PracticeQuesEntity>) {
      return data.data;
    } else {
      throw Exception("Error fetching practice questions");
    }
  }
}
