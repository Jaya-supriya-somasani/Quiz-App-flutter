
import 'package:quiz/domain/entities/practice_exercise.dart';

class PracticeExerciseModel extends PracticeExerciseEntity{
  final String? practiceFormatId;
  final String? practiceFormat;
  final int? sortOrder;
  final String? practiceFormatImageUrl;
  final int? totalQuestions;
  final int? completedQuestions;
  final double? accuracy;
  final int? incorrect;
  final int? skipped;
  final int? avgSpentTime;
  final String? speed;
  final String? subjectId;
  final String? subjectName;
  final String? subjectImageUrl;
  final String? primaryIcon;
  final String? practiceCard;
  final String? primaryColor;
  final String? secondaryIcon;
  final String? secondaryColor;
  final String? practiceCardAndroid;
  final String? chapterId;
  final String? chapterName;
  final String? chapterImageUrl;
  final String? practiceType;
  final Assets? assets;

  const PracticeExerciseModel({
    this.practiceFormatId,
    this.practiceFormat,
    this.sortOrder,
    this.practiceFormatImageUrl,
    this.totalQuestions,
    this.completedQuestions,
    this.accuracy,
    this.incorrect,
    this.skipped,
    this.avgSpentTime,
    this.speed,
    this.subjectId,
    this.subjectName,
    this.subjectImageUrl,
    this.primaryIcon,
    this.practiceCard,
    this.primaryColor,
    this.secondaryIcon,
    this.secondaryColor,
    this.practiceCardAndroid,
    this.chapterId,
    this.chapterName,
    this.chapterImageUrl,
    this.practiceType,
    this.assets,
  });

  factory PracticeExerciseModel.fromJson(Map<String, dynamic> map) {
    return PracticeExerciseModel(
      practiceFormatId: map['practice_format_id'] ?? '',
      practiceFormat: map['practice_format'] ?? '',
      sortOrder: map['sort_order'],
      practiceFormatImageUrl: map['practice_format_image_url'],
      totalQuestions: map['total_questions'],
      completedQuestions: map['completed_questions'],
      accuracy: (map['accuracy'] as num?)?.toDouble(),
      incorrect: map['incorrect'],
      skipped: map['skipped'],
      avgSpentTime: map['avg_spent_time'],
      speed: map['speed'],
      subjectId: map['subject_id'],
      subjectName: map['subject_name'],
      subjectImageUrl: map['subject_image_url'],
      primaryIcon: map['primary_icon'],
      practiceCard: map['practice_card'],
      primaryColor: map['primary_color'],
      secondaryIcon: map['secondary_icon'],
      secondaryColor: map['secondary_color'],
      practiceCardAndroid: map['practice_card_android'],
      chapterId: map['chapter_id'],
      chapterName: map['chapter_name'],
      chapterImageUrl: map['chapter_image_url'],
      practiceType: map['practice_type'],
      assets: map['assets'] != null ? Assets.fromJson(map['assets']) : null,
    );
  }
}

class Assets {
  final String? chapterIcon;
  final String? subjectIcon;
  final String? practiceCard;
  final String? primaryColor;
  final String? tertiaryColor;
  final String? secondaryColor;
  final List<String>? ekidsChapterIcon;
  final String? ekidsSubjectIcon;
  final String? ekidsPracticeCard;
  final ColorRange? primaryColorRange;
  final String? assignmentThumbnail;
  final ColorRange? secondaryColorRange;
  final String? ekidsLiveclassThumbnail;
  final String? ekidsAssignmentThumbnail;

  Assets({
    this.chapterIcon,
    this.subjectIcon,
    this.practiceCard,
    this.primaryColor,
    this.tertiaryColor,
    this.secondaryColor,
    this.ekidsChapterIcon,
    this.ekidsSubjectIcon,
    this.ekidsPracticeCard,
    this.primaryColorRange,
    this.assignmentThumbnail,
    this.secondaryColorRange,
    this.ekidsLiveclassThumbnail,
    this.ekidsAssignmentThumbnail,
  });

  factory Assets.fromJson(Map<String, dynamic> map) {
    return Assets(
      chapterIcon: map['chapter_icon'],
      subjectIcon: map['subject_icon'],
      practiceCard: map['practice_card'],
      primaryColor: map['primary_color'],
      tertiaryColor: map['tertiary_color'],
      secondaryColor: map['secondary_color'],
      ekidsChapterIcon: List<String>.from(map['ekids_chapter_icon']),
      ekidsSubjectIcon: map['ekids_subject_icon'],
      ekidsPracticeCard: map['ekids_practice_card'],
      primaryColorRange: ColorRange.fromJson(map['primary_color_range']),
      assignmentThumbnail: map['assignment_thumbnail'],
      secondaryColorRange: ColorRange.fromJson(map['secondary_color_range']),
      ekidsLiveclassThumbnail: map['ekids_liveclass_thumbnail'],
      ekidsAssignmentThumbnail: map['ekids_assignment_thumbnail'],
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

  factory ColorRange.fromJson(Map<String, dynamic> map) {
    return ColorRange(
      start: map['start'],
      end: map['end'],
    );
  }
}
