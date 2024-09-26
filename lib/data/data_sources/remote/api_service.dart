import 'package:quiz/data/data_sources/constants.dart';
import 'package:quiz/data/models/practice_ques_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/explore/v3/practice/topic-test-question')
  Future<HttpResponse<List<PracticeQuesModel>>> fetchTopicExerciseQuestion({
    @Query("pcsct_id") required String pcsctId,
    @Query("practice_format_id") required String practiceFormatId,
    @Query("question_number") required int questionNumber,
    @Query("is_previous") required bool isPrevious,
    @Query("program_id") required String programId,
    @Query("subject_id") required String subjectId,
    @Query("chapter_id") required String chapterId,
    @Header("Authorization") required String bearerToken,
    @Header("admissionNumber") required String admissionNumber,
    @Header("courseId") required String courseId,
  });
}
