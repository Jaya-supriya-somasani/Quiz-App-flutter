abstract class PracticeQuesEvent {
  const PracticeQuesEvent();
}

class GetExamDetails extends PracticeQuesEvent {
  final String getCurrentQuestion;

  const GetExamDetails(this.getCurrentQuestion);
}

class SelectAnswer extends PracticeQuesEvent {
  final String isAnswerSelected;

  const SelectAnswer(this.isAnswerSelected);
}

class NavigateToQuestion extends PracticeQuesEvent {
  final int questionIndex;

  NavigateToQuestion({required this.questionIndex});
}
