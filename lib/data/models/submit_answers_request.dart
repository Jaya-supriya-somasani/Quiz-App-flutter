class SubmitExerciseAnswerRequest {
  final String answerState;
  final String answerText;
  final String? chapterId;
  final String pcsctId;
  final String itemUri;
  final int noOfInteractions;
  final String practiceFormatId;
  final String practiceType;
  final String? programId;
  final String? questionId;
  final String? questionNumber;
  final String? questionType;
  final String? responseId;
  final String result;
  final String? subjectId;
  final int timeTaken;
  final String? topicId;

  SubmitExerciseAnswerRequest({
    required this.answerState,
    required this.answerText,
    this.chapterId,
    required this.pcsctId,
    required this.itemUri,
    required this.noOfInteractions,
    required this.practiceFormatId,
    required this.practiceType,
    this.programId,
    this.questionId,
    this.questionNumber,
    this.questionType,
    this.responseId,
    required this.result,
    this.subjectId,
    required this.timeTaken,
    this.topicId,
  });

  @override
  String toString() {
    return 'SubmitExerciseAnswerRequest('
        'answerState: $answerState, '
        'answerText: $answerText, '
        'chapterId: $chapterId, '
        'pcsctId: $pcsctId, '
        'itemUri: $itemUri, '
        'noOfInteractions: $noOfInteractions, '
        'practiceFormatId: $practiceFormatId, '
        'practiceType: $practiceType, '
        'programId: $programId, '
        'questionId: $questionId, '
        'questionNumber: $questionNumber, '
        'questionType: $questionType, '
        'responseId: $responseId, '
        'result: $result, '
        'subjectId: $subjectId, '
        'timeTaken: $timeTaken, '
        'topicId: $topicId'
        ')';
  }
}