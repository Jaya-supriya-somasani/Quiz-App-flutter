import 'package:equatable/equatable.dart';

import '../../data/models/practice_excercise_model.dart';

class PracticeExerciseEntity {
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

  PracticeExerciseEntity({
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

  factory PracticeExerciseEntity.fromJson(Map<String, dynamic> json) {
    return PracticeExerciseEntity(
      practiceFormatId: json['practiceFormatId'],
      practiceFormat: json['practiceFormat'],
      sortOrder: json['sortOrder'],
      practiceFormatImageUrl: json['practiceFormatImageUrl'],
      totalQuestions: json['totalQuestions'],
      completedQuestions: json['completedQuestions'],
      accuracy: json['accuracy'],
      incorrect: json['incorrect'],
      skipped: json['skipped'],
      avgSpentTime: json['avgSpentTime'],
      speed: json['speed'],
      subjectId: json['subjectId'],
      subjectName: json['subjectName'],
      subjectImageUrl: json['subjectImageUrl'],
      primaryIcon: json['primaryIcon'],
      practiceCard: json['practiceCard'],
      primaryColor: json['primaryColor'],
      secondaryIcon: json['secondaryIcon'],
      secondaryColor: json['secondaryColor'],
      practiceCardAndroid: json['practiceCardAndroid'],
      chapterId: json['chapterId'],
      chapterName: json['chapterName'],
      chapterImageUrl: json['chapterImageUrl'],
      practiceType: json['practiceType'],
      assets: Assets.fromJson(json['assets']), // Adjust as necessary if Assets is a class
    );
  }
}
