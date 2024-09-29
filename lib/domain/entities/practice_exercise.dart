import 'package:equatable/equatable.dart';

import '../../data/models/practice_excercise_model.dart';

class PracticeExerciseEntity extends Equatable {
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

  const PracticeExerciseEntity(
      {this.practiceFormatId,
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
      this.assets});

  @override
  List<Object?> get props => [
        practiceFormatId,
        practiceFormat,
        sortOrder,
        practiceFormatImageUrl,
        totalQuestions,
        completedQuestions,
        accuracy,
        incorrect,
        skipped,
        avgSpentTime,
        speed,
        subjectId,
        subjectImageUrl,
        subjectName,
        primaryIcon,
        practiceCard,
        primaryColor,
        secondaryIcon,
        secondaryColor,
        practiceCardAndroid,
        chapterId,
        chapterImageUrl,
        practiceType,
        assets
      ];

  factory PracticeExerciseEntity.fromModel(PracticeExerciseModel model) {
    return PracticeExerciseEntity(
        practiceType: model.practiceType,
        chapterId: model.chapterId,
        accuracy: model.accuracy,
        assets: model.assets,
        avgSpentTime: model.avgSpentTime,
        chapterImageUrl: model.chapterImageUrl,
        chapterName: model.chapterName,
        completedQuestions: model.completedQuestions,
        incorrect: model.incorrect,
        practiceCard: model.practiceCard,
        practiceCardAndroid: model.practiceCardAndroid,
        practiceFormat: model.practiceFormat,
        practiceFormatId: model.practiceFormatId,
        practiceFormatImageUrl: model.practiceFormatImageUrl,
        primaryColor: model.primaryColor,
        primaryIcon: model.primaryIcon,
        secondaryColor: model.secondaryColor,
        secondaryIcon: model.secondaryIcon,
        skipped: model.skipped,
        sortOrder: model.sortOrder,
        speed: model.speed,
        subjectId: model.subjectId,
        subjectImageUrl: model.subjectImageUrl,
        subjectName: model.subjectName,
        totalQuestions: model.totalQuestions);
  }
}
