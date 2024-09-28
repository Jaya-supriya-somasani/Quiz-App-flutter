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
        practiceFormatId: practiceFormatId,
        questionNumber: questionNumber,
        isPrevious: isPrevious,
        programId: programId,
        subjectId: subjectId,
        chapterId: chapterId,
        bearerToken: bearerToken,
        admissionNumber: admissionNumber,
        courseId: courseId,
      );

      if (response.response.statusCode == HttpStatus.ok) {
        final dataMap = response.response.data['data'];

        // Check if dataMap is null
        if (dataMap == null) {
          return DataFailedState(DioError(
            error: "Data is null",
            response: response.response,
            type: DioExceptionType.unknown,
            requestOptions: response.response.requestOptions,
          ));
        }

        final practiceData = dataMap['option_list'] as List<dynamic>?;

        if (practiceData == null) {
          return DataFailedState(DioError(
            error: "Practice data is null",
            response: response.response,
            type: DioExceptionType.unknown,
            requestOptions: response.response.requestOptions,
          ));
        }

        // Parse the list of practice questions and convert to List
        final parsedQuestions = practiceData
            .map((d) => PracticeQuesModel.fromJson(d))
            .toList(); // Convert Iterable to List

        return DataSuccessState(parsedQuestions); // Return the list of questions
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
      print("Exception !!!!!!!!!");
      return DataFailedState(e);
    }
  }
}
