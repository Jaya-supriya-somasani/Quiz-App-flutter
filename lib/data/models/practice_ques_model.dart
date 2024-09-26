import 'package:quiz/domain/entities/practice_ques_entity.dart';

class PracticeQuesModel extends PracticeQuesEntity {
  final String? id;
  final String? explanation;
  final int? feedbackStatus;
  final bool? isPrevious;
  final String? itemUri;
  final int? noOfInteractions;
  final List<OptionListEntity>? optionList;
  final String? pcsctId;
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
    this.pcsctId,
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
      id: map['id'] ?? "",
      explanation: map['explanation'] ?? "",
      feedbackStatus: map['feedback_status'] ?? "",
      isPrevious: map['is_previous'] ?? "",
      itemUri: map['item_uri'] ?? "",
      noOfInteractions: map['no_of_interactions'] ?? "",
      optionList: map['option_list'] ?? "",
      pcsctId: map['pcsct_id'] ?? ",",
      percStudentsCorrect: map['perc_students_correct'] ?? "",
      questionData: map['question_data'] ?? "",
      questionId: map['question_id'] ?? "",
      questionLevel: map['question_level'] ?? "",
      questionNumber: map['question_number'] ?? "",
      questionStatus: map['question_status'] ?? "",
      questionType: map['question_type'] ?? "",
      responseId: map['response_id'] ?? "",
      responseIdentifier: map['response_identifier'] ?? "",
      studentsAttempted: map['students_attempted'] ?? "",
      title: map['title'] ?? "",
      uri: map['uri'] ?? "",
    );
  }
}
