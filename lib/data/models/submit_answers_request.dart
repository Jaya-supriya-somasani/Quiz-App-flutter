class SubmitExerciseAnswerRequest {
  final String? answerState;
  final String? answerText;
  final String? chapterId;
  // final String? pcsctId;
  final String? itemUri;
  // final int? noOfInteractions;
  final String? practiceFormatId;
  final String? practiceType;
  final String? programId;
  final String? questionId;
  final String? questionNumber;
  final String? questionType;
  final String? responseId;
  // final String? result;
  final String? subjectId;
  final int? timeTaken;
  // final String? topicId;

  SubmitExerciseAnswerRequest({
    this.answerState,
    this.answerText,
    this.chapterId,
    // this.pcsctId,
    this.itemUri,
    // this.noOfInteractions,
    this.practiceFormatId,
    this.practiceType,
    this.programId,
    this.questionId,
    this.questionNumber,
    this.questionType,
    this.responseId,
    // this.result,
    this.subjectId,
    this.timeTaken,
    // this.topicId,
  });

  Map<String, dynamic> toJson() {
    return {
      'answer_state': answerState,
      // 'answer_text': answerText,
      'chapter_id': chapterId,
      // 'pcsct_id': pcsctId,
      'item_uri': itemUri,
      // 'no_of_interactions': noOfInteractions,
      'practice_format_id': practiceFormatId,
      'practice_type': practiceType,
      'program_id': programId,
      'question_id': questionId,
      'question_number': questionNumber,
      'question_type': questionType,
      'response_id': responseId,
      // 'result': result,
      'subject_id': subjectId,
      'timetaken': 4032,
      // 'topic_id': topicId,
    };
  }

  @override
  String toString() {
    return 'SubmitExerciseAnswerRequest('
        'answer_state: $answerState, '
        'answer_text: $answerText, '
        'chapter_id: $chapterId, '
        // 'pcsct_id: $pcsctId, '
        'item_uri: $itemUri, '
        // 'no_of_interactions: $noOfInteractions, '
        'practice_format_id: $practiceFormatId, '
        'practice_type: $practiceType, '
        'program_id: $programId, '
        'question_id: $questionId, '
        'question_number: $questionNumber, '
        'question_type: $questionType, '
        'response_id: $responseId, '
        // 'result: $result, '
        'subject_id: $subjectId, '
        'timetaken: 4032, '
        // 'topic_id: $topicId'
        ')';
  }
}
