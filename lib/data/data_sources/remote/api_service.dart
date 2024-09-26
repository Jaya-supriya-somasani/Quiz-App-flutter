import 'dart:io';

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
    @Query("pcsct_id") String? pcsctId,
    @Query("practice_format_id") String practiceFormatId,
    @Query("question_number") int questionNumber,
    @Query("is_previous") bool isPrevious,
    @Query("program_id") String programId,
    @Query("subject_id") String subjectId,
    @Query("chapter_id") String chapterId,
  });
}