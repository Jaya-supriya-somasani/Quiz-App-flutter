import 'package:quiz/domain/entities/practice_ques_entity.dart';

class PracticeQuesModel extends PracticeQuesEntity {
  final String? id;
  final String? explanation;
  final bool? isPrevious;
  final String? itemUri;
  final List<OptionListEntity>? optionList;
  final String? questionData;
  final String? questionId;
  final String? questionLevel;
  final String? questionNumber;
  final String? questionStatus;
  final String? questionType;
  final String? responseId;
  final String? responseIdentifier;
  final String? uri;
  final String? chapterId;
  final String? programId;
  final String? subjectId;
  final String? topicId;
  final String? practiceType;
  final String? practiceFormatId;

  const PracticeQuesModel({
    this.id,
    this.explanation,
    this.isPrevious,
    this.itemUri,
    this.optionList,
    this.questionData,
    this.questionId,
    this.questionLevel,
    this.questionNumber,
    this.questionStatus,
    this.questionType,
    this.responseId,
    this.responseIdentifier,
    this.uri,
    this.chapterId,
    this.programId,
    this.topicId,
    this.subjectId,
    this.practiceType,
    this.practiceFormatId,
  });

  factory PracticeQuesModel.fromJson(Map<String, dynamic> map) {
    print("Parsing PracticeQuesModel from JSON: $map"); // Debugging print

    return PracticeQuesModel(
      id: map['_id'] ?? "",
      explanation: map['explanation'] ?? "",
      isPrevious: map['is_previous'] ?? false,
      itemUri: map['item_uri'] ?? "",
      optionList: (map['option_list'] as List<dynamic>?)
          ?.map((option) => OptionListEntity.fromJson(option))
          .toList(),
      questionData: map['question_data'] ?? "",
      questionId: map['question_id'] ?? "",
      questionLevel: map['question_level'] ?? "",
      questionNumber: map['question_number'] ?? "",
      questionStatus: map['question_status'] ?? "",
      questionType: map['question_type'] ?? "",
      responseId: map['response_id'] ?? "",
      responseIdentifier: map['response_identifier'] ?? "",
      uri: map['uri'] ?? "",
      chapterId: map['chapter_id'] ?? "",
      topicId: map['topic_id'] ?? "",
      subjectId: map['subject_id'] ?? "",
      programId: map['program_id'] ?? "",
      practiceType: map['practice_type'] ?? "",
      practiceFormatId: map['practice_format_id'] ?? "",
    );
  }
}
