import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/submit_answer_response.dart';
import 'package:quiz/domain/repositories/submit_answers_repo.dart';
import 'package:quiz/utils/data_state.dart';

class SubmitAnswerRepoImp extends SubmitAnswersRepo {
  final ApiService _apiService;

  SubmitAnswerRepoImp(this._apiService);

  @override
  Future<DataState<SubmitAnswerResponse>> submitAnswerData() {
    throw UnimplementedError();
  }
}
