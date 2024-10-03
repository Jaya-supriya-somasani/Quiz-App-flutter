class PracticeExerciseModel {
  final String? practiceFormatId;
  final String? practiceFormat;
  final int? sortOrder;
  final String? practiceFormatImageUrl;
  final int? totalQuestions;
  final int? completedQuestions;
  final int? accuracy;
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

  PracticeExerciseModel({
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
      accuracy: (map['accuracy'] as num?)?.toInt(),
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
  final String chapterIcon;
  final String subjectIcon;
  final String practiceCard;
  final String primaryColor;
  final String tertiaryColor;
  final String secondaryColor;
  final List<String> ekidsChapterIcon;
  final String ekidsSubjectIcon;
  final String ekidsPracticeCard;
  final Map<String, String> primaryColorRange;
  final String assignmentThumbnail;
  final Map<String, String> secondaryColorRange;
  final String ekidsLiveclassThumbnail;
  final String ekidsAssignmentThumbnail;

  const Assets({
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

  @override
  List<Object?> get props => [
        chapterIcon,
        subjectIcon,
        practiceCard,
        primaryColor,
        tertiaryColor,
        secondaryColor,
        ekidsChapterIcon,
        ekidsSubjectIcon,
        ekidsPracticeCard,
        primaryColorRange,
        assignmentThumbnail,
        secondaryColorRange,
        ekidsLiveclassThumbnail,
        ekidsAssignmentThumbnail,
      ];

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
      primaryColorRange: Map<String, String>.from(json['primary_color_range']),
      assignmentThumbnail: json['assignment_thumbnail'],
      secondaryColorRange:
          Map<String, String>.from(json['secondary_color_range']),
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

  factory ColorRange.fromJson(Map<String, dynamic> map) {
    return ColorRange(
      start: map['start'],
      end: map['end'],
    );
  }
}
