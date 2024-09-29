import 'dart:io';

import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/practice_excercise_model.dart';
import 'package:quiz/domain/entities/practice_exercise.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/utils/constants.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:dio/dio.dart';


class PracticeExerciseRepoImp implements PracticeExerciseRepo{
  final ApiService _apiService;
  PracticeExerciseRepoImp(this._apiService);

  @override
  Future<DataState<List<PracticeExerciseEntity>>> getPracticeExerciseData() async{
    try {
      final response = await _apiService.fetchExerciseData(
        subjectId: subjectId,
        admissionNumber: admissionNumber,
        bearerToken: bearerToken,
        chapterId: chapterId,
        courseId: courseId,
        programId: programId,
        topicId: "",
      );

      if (response.response.statusCode == HttpStatus.ok) {
        final dataMap = response.response.data['data'];

        if (dataMap == null) {
          return DataFailedState(DioError(
            error: "Data is null",
            response: response.response,
            type: DioExceptionType.unknown,
            requestOptions: response.response.requestOptions,
          ));
        }

        final exerciseData = PracticeExerciseModel.fromJson(dataMap);
        //todo need to change here
        return DataSuccessState(exerciseData as List<PracticeExerciseEntity>);
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
      print("Exception: $e");
      return DataFailedState(e);
    }
  }
}