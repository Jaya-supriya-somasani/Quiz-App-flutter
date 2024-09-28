import 'package:equatable/equatable.dart';
import 'package:quiz/data/models/practice_ques_model.dart';

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
  List<Object?> get props => [
    id,
    questionData,
    explanation,
    optionList,
    questionId,
    hint,
    topicName,
    title,
    studentsAttempted,
    responseId,
    questionType,
    questionStatus,
    questionNumber,
    percStudentsCorrect,
    noOfInteractions,
    questionLevel,
    uri,
    responseIdentifier,
    feedbackStatus,
    itemUri,
    isPrevious,
  ];

  factory PracticeQuesEntity.fromModel(PracticeQuesModel model) {
    return PracticeQuesEntity(
      title: model.title,
      explanation: model.explanation,
      feedbackStatus: model.feedbackStatus,
      hint: model.hint,
      id: model.id,
      isPrevious: model.isPrevious,
      itemUri: model.itemUri,
      noOfInteractions: model.noOfInteractions,
      optionList: model.optionList != null
          ? List<OptionListEntity>.from(
          model.optionList!.map((option) => OptionListEntity.fromJson(option as Map<String,dynamic>)))
          : null,
      studentsAttempted: model.studentsAttempted,
      responseIdentifier: model.responseIdentifier,
      responseId: model.responseId,
      questionType: model.questionType,
      questionStatus: model.questionStatus,
      questionNumber: model.questionNumber,
      questionId: model.questionId,
      questionData: model.questionData,
      percStudentsCorrect: model.percStudentsCorrect,
      questionLevel: model.questionLevel,
      topicName: model.topicName,
      uri: model.uri,
    );
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

  factory OptionListEntity.fromJson(Map<String, dynamic> json) {
    return OptionListEntity(
      optionData: json['option_data'],
      optionId: json['option_id'],
      isCorrectAnswer1: json['isCorrectAnswer1'],
      isSelected: json['is_selected'],
      isAnswer: json['is_answer'],
    );
  }

  @override
  List<Object?> get props => [
    optionData,
    optionId,
    isCorrectAnswer1,
    isSelected,
    isAnswer,
  ];
}