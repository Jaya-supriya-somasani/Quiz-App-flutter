import 'package:dio/dio.dart';
import 'package:quiz/data/data_sources/constants.dart';
import 'package:quiz/data/models/api_response.dart';
import 'package:quiz/data/models/practice_ques_model.dart';
import 'package:quiz/data/models/submit_answer_response.dart';
import 'package:quiz/data/models/submit_answers_request.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Log request information
        print("Request: ${options.method} ${options.uri}");
        print("Headers: ${options.headers}");
        print("Request Body: ${options.data}");

        // You can modify headers or other options here if necessary
        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Log response information
        print("Response Status: ${response.statusCode}");
        print("Response Data: ${response.data}");
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        // Log error information
        print("Error: ${e.message}");
        if (e.response != null) {
          print("Error Data: ${e.response?.data}");
        }
        return handler.next(e); // continue
      },
    ));

    // Now return the generated Retrofit API service
    return _ApiService(dio);
  }

  // Define the API endpoints

  @GET('/explore/v3/practice/topic-test-question')
  Future<HttpResponse<PracticeQuesModel>> fetchTopicExerciseQuestion({
    @Query("practice_format_id") required String practiceFormatId,
    @Query("question_number") required String questionNumber,
    @Query("is_previous") required bool isPrevious,
    @Query("program_id") required String programId,
    @Query("subject_id") required String subjectId,
    @Query("chapter_id") required String chapterId,
    @Header("Authorization") required String bearerToken,
    @Header("admissionNumber") required String admissionNumber,
    @Header("courseId") required String courseId,
  });

  @GET('/explore/v3/practice/topic-exercise-list')
  Future<HttpResponse<PracticeExerciseModelResponse>> fetchExerciseData({
    @Query("subject_id") required String subjectId,
    @Query("chapter_id") required String chapterId,
    @Query("program_id") required String programId,
    @Query("topic_id") required String topicId,
    @Header("Authorization") required String bearerToken,
    @Header("admissionNumber") required String admissionNumber,
    @Header("courseId") required String courseId,
  });

  @POST("/explore/v3/practice/submit-answer")
  Future<HttpResponse<SubmitAnswerResponse>> submitExerciseAnswer({
    @Header("Authorization") required String bearerToken,
    @Header("admissionNumber") required String admissionNumber,
    @Header("courseId") required String courseId,
    @Body() required SubmitExerciseAnswerRequest submitRequest,
  });
}