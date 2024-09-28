import 'package:quiz/domain/entities/practice_ques_entity.dart';

class PracticeQuesModel extends PracticeQuesEntity {
  final String? id;
  final String? explanation;
  final int? feedbackStatus;
  final bool? isPrevious;
  final String? itemUri;
  final int? noOfInteractions;
  final List<OptionListEntity>? optionList;
  final int? percStudentsCorrect;
  final String? questionData;
  final String? questionId;
  final String? questionLevel;
  final String? questionNumber;
  final String? questionStatus;
  final String? questionType;
  final String? responseId;
  final String? responseIdentifier;
  final int? studentsAttempted;
  final String? title;
  final String? uri;

  const PracticeQuesModel({
    this.id,
    this.explanation,
    this.feedbackStatus,
    this.isPrevious,
    this.itemUri,
    this.noOfInteractions,
    this.optionList,
    this.percStudentsCorrect,
    this.questionData,
    this.questionId,
    this.questionLevel,
    this.questionNumber,
    this.questionStatus,
    this.questionType,
    this.responseId,
    this.responseIdentifier,
    this.studentsAttempted,
    this.title,
    this.uri,
  });

  factory PracticeQuesModel.fromJson(Map<String, dynamic> map) {
    return PracticeQuesModel(
      id: map['_id'] ?? "",
      explanation: map['explanation'] ?? "",
      feedbackStatus: map['feedback_status'] ?? 0,
      isPrevious: map['is_previous'] ?? false,
      itemUri: map['item_uri'] ?? "",
      noOfInteractions: map['no_of_interactions'] ?? 0,
      optionList: (map['option_list'] as List<dynamic>?)
          ?.map((option) => OptionListEntity.fromJson(option))
          .toList(),
      percStudentsCorrect: map['perc_students_correct'] ?? 0,
      questionData: map['question_data'] ?? "",
      questionId: map['question_id'] ?? "",
      questionLevel: map['question_level'] ?? "",
      questionNumber: map['question_number'] ?? "",
      questionStatus: map['question_status'] ?? "",
      questionType: map['question_type'] ?? "",
      responseId: map['response_id'] ?? "",
      responseIdentifier: map['response_identifier'] ?? "",
      studentsAttempted: map['students_attempted'] ?? 0,
      title: map['title'] ?? "",
      uri: map['uri'] ?? "",
    );
  }

}
