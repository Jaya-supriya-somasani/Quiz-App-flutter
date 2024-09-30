import 'dart:io';

import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/models/practice_excercise_model.dart';
import 'package:quiz/domain/entities/practice_exercise.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/utils/constants.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:dio/dio.dart';

class PracticeExerciseRepoImp implements PracticeExerciseRepo {
  final ApiService _apiService;

  PracticeExerciseRepoImp(this._apiService);

  @override
  Future<DataState<List<PracticeExerciseEntity>>>
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
        final dataMap = response.response.data['data'];
        print("dataMap--- $dataMap");
        if (dataMap != null) {
          final exerciseData = dataMap.map((item) {
            return PracticeExerciseModel.fromJson(item);
          });
          return DataSuccessState(exerciseData);
        } else {
          return DataFailedState(
            DioError(
              error: "Expected a list but received: ${dataMap.runtimeType}",
              response: response.response,
              type: DioErrorType.unknown,
              requestOptions:
                  response.response.requestOptions,
            ),
          );
        }
      } else {
        return DataFailedState(
          DioError(
            error: response.response.statusMessage ?? "Unknown error",
            response: response.response,
            type: DioExceptionType.unknown,
            requestOptions:
                response.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print("Exception in exercise: ${e.message}");
      return DataFailedState(e);
    } catch (e) {
      print("Unexpected error: $e");
      return DataFailedState(DioException(
        error: "Unexpected error occurred",
        type: DioExceptionType.unknown, // Use appropriate type
        requestOptions: RequestOptions(
            path: ""),
      ));
    }
  }
}