import 'dart:io';

import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/submit_answer_response.dart';
import 'package:quiz/data/models/submit_answers_request.dart';
import 'package:quiz/domain/repositories/submit_answers_repo.dart';
import 'package:quiz/utils/data_state.dart';

import '../../utils/constants.dart';
class SubmitAnswerRepoImp extends SubmitAnswersRepo {
  final ApiService _apiService;

  SubmitAnswerRepoImp(this._apiService);

  @override
  Future<DataState<SubmitAnswerResponse>> submitAnswerData(
      SubmitExerciseAnswerRequest submitAnsRequest) async {
    final response = await _apiService.submitExerciseAnswer(
        bearerToken: bearerToken,
        admissionNumber: admissionNumber,
        courseId: courseId,
        submitRequest: submitAnsRequest);
    print("data $response");
    try {
      if (response.response.statusCode == HttpStatus.ok) {
        final dataMap = response.response.data['data'];

        // if (dataMap == null) {
        //   return DataFailedState("Data is null");
        // }
        print("Data received: $dataMap");
        final submittedData = SubmitAnswerResponse.fromJson(dataMap);
        return DataSuccessState(submittedData);
      } else {
        return DataFailedState(
            "Response status: ${response.response.statusCode}");
      }
    } catch (e) {
      return DataFailedState(e.toString());
    }
  }
}
