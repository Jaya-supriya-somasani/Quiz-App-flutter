abstract class PracticeQuesEvent {
  const PracticeQuesEvent();
}

class GetExamDetails extends PracticeQuesEvent {
  final String getCurrentQuestion;
  const GetExamDetails(this.getCurrentQuestion);
}