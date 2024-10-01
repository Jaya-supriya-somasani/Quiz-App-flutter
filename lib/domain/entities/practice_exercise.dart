import 'package:equatable/equatable.dart';

import '../../data/models/practice_excercise_model.dart';

class PracticeExerciseEntity {
  final String subjectId;
  final String subjectName;
  final String subjectImageUrl;
  final String chapterId;
  final String chapterName;
  final String chapterImageUrl;
  final int totalQuestions;
  // Add other fields as necessary

  PracticeExerciseEntity({
    required this.subjectId,
    required this.subjectName,
    required this.subjectImageUrl,
    required this.chapterId,
    required this.chapterName,
    required this.chapterImageUrl,
    required this.totalQuestions,
  });

  factory PracticeExerciseEntity.fromJson(Map<String, dynamic> json) {
    return PracticeExerciseEntity(
      subjectId: json['subject_id'],
      subjectName: json['subject_name'],
      subjectImageUrl: json['subject_image_url'] ?? '', // Handle null values
      chapterId: json['chapter_id'],
      chapterName: json['chapter_name'],
      chapterImageUrl: json['chapter_image_url'] ?? '',
      totalQuestions: json['total_questions'],
      // Initialize other fields as necessary
    );
  }
}
