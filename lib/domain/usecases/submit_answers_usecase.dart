import 'package:quiz/data/models/submit_answer_response.dart';
import 'package:quiz/data/models/submit_answers_request.dart';
import 'package:quiz/domain/repositories/submit_answers_repo.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class SubmitAnswersUseCase implements UseCase<dynamic,SubmitExerciseAnswerRequest>{

  final SubmitAnswersRepo submitAnswersRepo;

  SubmitAnswersUseCase(this.submitAnswersRepo);
  @override
  Future<dynamic> call({required SubmitExerciseAnswerRequest params}) async {
    final response= await submitAnswersRepo.submitAnswerData(params);
    print("usecase-responseSubmitAnswersUseCase $response");
    if (response is DataSuccessState<SubmitAnswerResponse>) {
      print("response.data.data--- ${response.data.data}");
      return response.data.data;
    }else if (response is DataFailedState<SubmitAnswerResponse>) {
      print("Submit answer failed: ${response.error}");
      throw Exception("Error in Submit answer Usecase: ${response.error}");
    } else {
      throw Exception("Unknown error in Submit answer Usecase");
    }
  }
}