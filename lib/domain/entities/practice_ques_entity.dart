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
  final String? responseId;
  final String? questionType;
  final String? questionStatus;
  final String? questionNumber;
  final String? questionLevel;
  final String? uri;
  final String? responseIdentifier;
  final String? itemUri;
  final bool? isPrevious;
  final String? chapterId;
  final String? programId;
  final String? subjectId;
  final String? topicId;
  final String? quesType;

  const PracticeQuesEntity({
    this.id,
    this.questionData,
    this.explanation,
    this.optionList,
    this.questionId,
    this.hint,
    this.topicName,
    this.responseId,
    this.questionType,
    this.questionStatus,
    this.questionNumber,
    this.questionLevel,
    this.uri,
    this.responseIdentifier,
    this.itemUri,
    this.isPrevious,
    this.chapterId,
    this.programId,
    this.subjectId,
    this.topicId,
    this.quesType,
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
    responseId,
    questionType,
    questionStatus,
    questionNumber,
    questionLevel,
    uri,
    responseIdentifier,
    itemUri,
    isPrevious,
    chapterId,
    programId,
    subjectId,
    topicId,
    questionType,
  ];

  factory PracticeQuesEntity.fromModel(PracticeQuesModel model) {
    return PracticeQuesEntity(
      explanation: model.explanation,
      hint: model.hint,
      id: model.id,
      isPrevious: model.isPrevious,
      itemUri: model.itemUri,
      optionList: model.optionList != null
          ? List<OptionListEntity>.from(
          model.optionList!.map((option) => OptionListEntity.fromJson(option as Map<String,dynamic>)))
          : null,
      responseIdentifier: model.responseIdentifier,
      responseId: model.responseId,
      questionType: model.questionType,
      questionStatus: model.questionStatus,
      questionNumber: model.questionNumber,
      questionId: model.questionId,
      questionData: model.questionData,
      questionLevel: model.questionLevel,
      topicName: model.topicName,
      uri: model.uri,
      chapterId: model.chapterId,
      programId: model.programId,
      subjectId: model.subjectId,
      topicId: model.topicId,
      quesType: model.questionType,
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