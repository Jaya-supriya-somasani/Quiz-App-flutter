class SubmitExerciseAnswerRequest {
  final String answerState;
  final String answerText;
  final String chapterId;
  final String pcsctId;
  final String itemUri;
  final int noOfInteractions;
  final String practiceFormatId;
  final String practiceType;
  final String programId;
  final String questionId;
  final int questionNumber;
  final String questionType;
  final String responseId;
  final String result;
  final String subjectId;
  final int timeTaken;
  final String topicId;

  SubmitExerciseAnswerRequest({
    required this.answerState,
    required this.answerText,
    required this.chapterId,
    required this.pcsctId,
    required this.itemUri,
    required this.noOfInteractions,
    required this.practiceFormatId,
    required this.practiceType,
    required this.programId,
    required this.questionId,
    required this.questionNumber,
    required this.questionType,
    required this.responseId,
    required this.result,
    required this.subjectId,
    required this.timeTaken,
    required this.topicId,
  });

  Map<String, dynamic> toJson() {
    return {
      'answer_state': answerState,
      'answer_text': answerText,
      'chapter_id': chapterId,
      'pcsct_id': pcsctId,
      'item_uri': itemUri,
      'no_of_interactions': noOfInteractions,
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
}