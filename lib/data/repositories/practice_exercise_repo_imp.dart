import 'dart:io';

import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/api_response.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/utils/constants.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:dio/dio.dart';

class PracticeExerciseRepoImp implements PracticeExerciseRepo {
  final ApiService _apiService;

  PracticeExerciseRepoImp(this._apiService);

  @override
  Future<DataState<PracticeExerciseModelResponse>>
      getPracticeExerciseData() async {
    final response = await _apiService.fetchExerciseData(
      subjectId: subjectId,
      admissionNumber: admissionNumber,
      bearerToken: bearerToken,
      chapterId: chapterId,
      courseId: courseId,
      programId: programId,
      topicId: "",
    );
    try {
      if (response.response.statusCode == HttpStatus.ok) {
        PracticeExerciseModelResponse practiceExerciseModelResponse =
            PracticeExerciseModelResponse.fromJson(response.response.data);
        return DataSuccessState(practiceExerciseModelResponse);
      } else {
        return DataFailedState("Unknown Error");
      }
    } on DioException catch (e) {
      print("Exception in exercise: ${e.message}");
      return DataFailedState(e.message!);
    }
  }
}
