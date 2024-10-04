import 'package:quiz/domain/entities/practice_exercise.dart';

class PracticeExerciseModelResponse {
  final String status;
  final String message;
  final List<PracticeExerciseEntity> data;
  final String? errorCode;

  PracticeExerciseModelResponse({
    required this.status,
    required this.message,
    required this.data,
    this.errorCode,
  });

  factory PracticeExerciseModelResponse.fromJson(Map<String, dynamic> json) {
    return PracticeExerciseModelResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((e) => PracticeExerciseEntity.fromJson(e))
          .toList(),
      errorCode: json['errorCode'],
    );
  }
}
