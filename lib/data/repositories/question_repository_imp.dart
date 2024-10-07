import 'dart:io';
import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/practice_ques_model.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/utils/constants.dart';
import 'package:quiz/utils/data_state.dart';

class PracticeQuesRepositoryImp implements PracticeQuesRepository {
  final ApiService _apiService;

  PracticeQuesRepositoryImp(this._apiService);

  @override
  Future<DataState<PracticeQuesModel>> getPracticeQuestions({required String questionNumber}) async {
    print("current_question in implementation $questionNumber ${questionNumber.runtimeType}");

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

    print("Received response: ${response.response.data}");

    try {
      if (response.response.statusCode == HttpStatus.ok) {
        final dataMap = response.response.data['data'];

        if (dataMap == null || dataMap.isEmpty) {
          return DataFailedState("Data is null or empty");
        }
        print("Data received: in question repo $dataMap");
        final practiceQuestion = PracticeQuesModel.fromJson(dataMap);
        return DataSuccessState(practiceQuestion);
      } else {
        final errorMessage = response.response.data['message'] ?? "Unknown error occurred.";
        return DataFailedState("Response status: ${response.response.statusCode}, Message: $errorMessage");
      }
    } catch (e) {
      print("Exception in question repo implementation: $e");
      return DataFailedState(e.toString());
    }
  }
}