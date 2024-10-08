class SubmitExerciseAnswerRequest {
  final String? answerState;
  final String? answerText;
  final String? chapterId;
  final String? itemUri;
  final int? noOfInteractions;
  final String? pcsctId;
  final String? practiceFormatId;
  final String? practiceType;
  final String? programId;
  final String? questionId;
  final String? questionNumber;
  final String? questionType;
  final String? responseId;
  final String? result;
  final String? subjectId;
  final int? timeTaken;
  final String? topicId;

  SubmitExerciseAnswerRequest({
    this.answerState,
    this.answerText,
    this.chapterId,
    this.itemUri,
    this.noOfInteractions,
    this.pcsctId,
    this.practiceFormatId,
    this.practiceType,
    this.programId,
    this.questionId,
    this.questionNumber,
    this.questionType,
    this.responseId,
    this.result,
    this.subjectId,
    this.timeTaken,
    this.topicId,
  });

  Map<String, dynamic> toJson() {
    return {
      'answer_state': answerState,
      'answer_text': answerText,
      'chapter_id': chapterId,
      'item_uri': itemUri,
      'no_of_interactions': noOfInteractions,
      'pcsct_id': pcsctId,
      'practice_format_id': practiceFormatId,
      'practice_type': practiceType,
      'program_id': programId,
      'question_id': questionId,
      'question_number': questionNumber,
      'question_type': questionType,
      'response_id': responseId,
      'result': result,
      'subject_id': subjectId,
      'timetaken': timeTaken,
      'topic_id': topicId,
    };
  }

  factory SubmitExerciseAnswerRequest.fromJson(Map<String, dynamic> json) {
    return SubmitExerciseAnswerRequest(
      answerState: json['answer_state'],
      answerText: json['answer_text'],
      chapterId: json['chapter_id'],
      itemUri: json['item_uri'],
      noOfInteractions: json['no_of_interactions'],
      pcsctId: json['pcsct_id'],
      practiceFormatId: json['practice_format_id'],
      practiceType: json['practice_type'],
      programId: json['program_id'],
      questionId: json['question_id'],
      questionNumber: json['question_number'],
      questionType: json['question_type'],
      responseId: json['response_id'],
      result: json['result'],
      subjectId: json['subject_id'],
      timeTaken: json['timeTaken'],
      topicId: json['topic_id'],
    );
  }
}