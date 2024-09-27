import 'dart:io';

import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/practice_ques_model.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/utils/constants.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:dio/dio.dart';

class PracticeQuesRepositoryImp implements PracticeQuesRepository {
  final ApiService _apiService;

  PracticeQuesRepositoryImp(this._apiService);

  @override
  Future<DataState<List<PracticeQuesModel>>> getPracticeQuestions() async {
    try {
      final response = await _apiService.fetchTopicExerciseQuestion(
          pcsctId: pcsctId,
          practiceFormatId: practiceFormatId,
          questionNumber: questionNumber,
          isPrevious: isPrevious,
          programId: programId,
          subjectId: subjectId,
          chapterId: chapterId,
          bearerToken: bearerToken,
          admissionNumber: admissionNumber,
          courseId: courseId);

      if (response.response.statusCode == HttpStatus.ok) {
        final questionData =
            response.response.data['data'] as Map<String, dynamic>;
        print("questiondata--$questionData");
        final questionListData = questionData['option_list'] as List;

        // Convert each dynamic entry to a PracticeQuesModel
        final questions = questionListData
            .map((question) => PracticeQuesModel.fromJson(question))
            .toList();

        return DataSuccessState(questions);
      } else {
        return DataFailedState(
          DioError(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.unknown,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailedState(e);
    }
  }
}
