import 'package:quiz/data/models/submit_answers_request.dart';

abstract class SubmitAnswersEvent{}
class PostSubmitAnswerDetails extends SubmitAnswersEvent{
  final SubmitExerciseAnswerRequest submitExerciseAnswerRequest;
  PostSubmitAnswerDetails(this.submitExerciseAnswerRequest);
}