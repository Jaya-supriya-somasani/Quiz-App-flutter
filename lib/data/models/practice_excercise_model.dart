
import 'package:quiz/domain/entities/practice_exercise.dart';

class PracticeExerciseModel extends PracticeExerciseEntity{
  final String practiceFormatId;
  final String practiceFormat;
  final int sortOrder;
  final String practiceFormatImageUrl;
  final int totalQuestions;
  final int completedQuestions;
  final double accuracy;
  final int incorrect;
  final int skipped;
  final int avgSpentTime;
  final String speed;
  final String subjectId;
  final String subjectName;
  final String subjectImageUrl;
  final String primaryIcon;
  final String practiceCard;
  final String primaryColor;
  final String secondaryIcon;
  final String secondaryColor;
  final String practiceCardAndroid;
  final String chapterId;
  final String chapterName;
  final String chapterImageUrl;
  final String practiceType;
  final Assets assets;

  PracticeExerciseModel({
    required this.practiceFormatId,
    required this.practiceFormat,
    required this.sortOrder,
    required this.practiceFormatImageUrl,
    required this.totalQuestions,
    required this.completedQuestions,
    required this.accuracy,
    required this.incorrect,
    required this.skipped,
    required this.avgSpentTime,
    required this.speed,
    required this.subjectId,
    required this.subjectName,
    required this.subjectImageUrl,
    required this.primaryIcon,
    required this.practiceCard,
    required this.primaryColor,
    required this.secondaryIcon,
    required this.secondaryColor,
    required this.practiceCardAndroid,
    required this.chapterId,
    required this.chapterName,
    required this.chapterImageUrl,
    required this.practiceType,
    required this.assets,
  });

  factory PracticeExerciseModel.fromJson(Map<String, dynamic> json) {
    return PracticeExerciseModel(
      practiceFormatId: json['practice_format_id'],
      practiceFormat: json['practice_format'],
      sortOrder: json['sort_order'],
      practiceFormatImageUrl: json['practice_format_image_url'],
      totalQuestions: json['total_questions'],
      completedQuestions: json['completed_questions'],
      accuracy: json['accuracy'].toDouble(),
      incorrect: json['incorrect'],
      skipped: json['skipped'],
      avgSpentTime: json['avg_spent_time'],
      speed: json['speed'],
      subjectId: json['subject_id'],
      subjectName: json['subject_name'],
      subjectImageUrl: json['subject_image_url'],
      primaryIcon: json['primary_icon'],
      practiceCard: json['practice_card'],
      primaryColor: json['primary_color'],
      secondaryIcon: json['secondary_icon'],
      secondaryColor: json['secondary_color'],
      practiceCardAndroid: json['practice_card_android'],
      chapterId: json['chapter_id'],
      chapterName: json['chapter_name'],
      chapterImageUrl: json['chapter_image_url'],
      practiceType: json['practice_type'],
      assets: Assets.fromJson(json['assets']),
    );
  }
}

class Assets {
  final String chapterIcon;
  final String subjectIcon;
  final String practiceCard;
  final String primaryColor;
  final String tertiaryColor;
  final String secondaryColor;
  final List<String> ekidsChapterIcon;
  final String ekidsSubjectIcon;
  final String ekidsPracticeCard;
  final ColorRange primaryColorRange;
  final String assignmentThumbnail;
  final ColorRange secondaryColorRange;
  final String ekidsLiveclassThumbnail;
  final String ekidsAssignmentThumbnail;

  Assets({
    required this.chapterIcon,
    required this.subjectIcon,
    required this.practiceCard,
    required this.primaryColor,
    required this.tertiaryColor,
    required this.secondaryColor,
    required this.ekidsChapterIcon,
    required this.ekidsSubjectIcon,
    required this.ekidsPracticeCard,
    required this.primaryColorRange,
    required this.assignmentThumbnail,
    required this.secondaryColorRange,
    required this.ekidsLiveclassThumbnail,
    required this.ekidsAssignmentThumbnail,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      chapterIcon: json['chapter_icon'],
      subjectIcon: json['subject_icon'],
      practiceCard: json['practice_card'],
      primaryColor: json['primary_color'],
      tertiaryColor: json['tertiary_color'],
      secondaryColor: json['secondary_color'],
      ekidsChapterIcon: List<String>.from(json['ekids_chapter_icon']),
      ekidsSubjectIcon: json['ekids_subject_icon'],
      ekidsPracticeCard: json['ekids_practice_card'],
      primaryColorRange: ColorRange.fromJson(json['primary_color_range']),
      assignmentThumbnail: json['assignment_thumbnail'],
      secondaryColorRange: ColorRange.fromJson(json['secondary_color_range']),
      ekidsLiveclassThumbnail: json['ekids_liveclass_thumbnail'],
      ekidsAssignmentThumbnail: json['ekids_assignment_thumbnail'],
    );
  }
}

class ColorRange {
  final String start;
  final String end;

  ColorRange({
    required this.start,
    required this.end,
  });

  factory ColorRange.fromJson(Map<String, dynamic> json) {
    return ColorRange(
      start: json['start'],
      end: json['end'],
    );
  }
}
