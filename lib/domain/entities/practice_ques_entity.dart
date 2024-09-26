import 'package:equatable/equatable.dart';

class PracticeQuesEntity extends Equatable {
  final String? id;
  final String? questionData;
  final String? explanation;
  final List<OptionListEntity>? optionList;
  final String? questionId;
  final String? hint;
  final String? topicName;
  final String? title;
  final int? studentsAttempted;
  final String? responseId;
  final String? questionType;
  final String? questionStatus;
  final String? questionNumber;
  final String? pcsctId;
  final int? percStudentsCorrect;
  final int? noOfInteractions;
  final String? questionLevel;
  final String? uri;
  final String? responseIdentifier;
  final int? feedbackStatus;
  final String? itemUri;
  final bool? isPrevious;

  const PracticeQuesEntity({
    this.id,
    this.questionData,
    this.explanation,
    this.optionList,
    this.questionId,
    this.hint,
    this.topicName,
    this.title,
    this.studentsAttempted,
    this.responseId,
    this.questionType,
    this.questionStatus,
    this.questionNumber,
    this.pcsctId,
    this.percStudentsCorrect,
    this.noOfInteractions,
    this.questionLevel,
    this.uri,
    this.responseIdentifier,
    this.feedbackStatus,
    this.itemUri,
    this.isPrevious,
  });

  @override
  List<Object?> get props {
    return [
      id,
      questionData,
      explanation,
      questionId,
      hint,
      topicName,
      title,
      studentsAttempted,
      responseId,
      questionType,
      questionStatus,
      questionNumber,
      pcsctId,
      percStudentsCorrect,
      noOfInteractions,
      questionLevel,
      uri,
      responseIdentifier,
      feedbackStatus,
      itemUri,
      isPrevious,
    ];
  }
}

class OptionListEntity extends Equatable {
  final String? optionData;
  final String? optionId;
  final bool? isCorrectAnswer1;
  final bool? isSelected;
  final bool? isAnswer;

  const OptionListEntity({
    this.optionData,
    this.optionId,
    this.isCorrectAnswer1,
    this.isSelected,
    this.isAnswer,
  });

  @override
  List<Object?> get props {
    return [optionData, optionId, isCorrectAnswer1, isSelected, isAnswer];
  }
}
