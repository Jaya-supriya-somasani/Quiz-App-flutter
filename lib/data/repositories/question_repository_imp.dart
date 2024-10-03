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

    print("current_question question_repo impl${questionNumber.runtimeType}");
    try {
      if (response.response.statusCode == HttpStatus.ok) {
        final dataMap = response.response.data['data'];

        if (dataMap == null) {
          return DataFailedState("Data is null");
        }
        print("Data received: $dataMap");
        final practiceQuestion = PracticeQuesModel.fromJson(dataMap);
        return DataSuccessState(practiceQuestion);
      } else {
        return DataFailedState("Response status: ${response.response.statusCode}");
      }
    } catch (e) {
      print("Exception in question repo impl: $e");
      return DataFailedState(e.toString());
    }
  }
}