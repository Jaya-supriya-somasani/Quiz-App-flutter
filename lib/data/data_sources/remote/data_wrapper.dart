import 'package:quiz/data/models/practice_ques_model.dart';

class DataWrapper {
  final PracticeQuesModel practiceQuesModel;

  DataWrapper({required this.practiceQuesModel});

  factory DataWrapper.fromJson(Map<String, dynamic> json) {
    // Check if 'practice' is a Map, and extract the list from it
    final practiceData = json['practice'] as Map<String, dynamic>;
    return DataWrapper(
      // Assuming 'questions' is the key that holds the list of practice questions
      practiceQuesModel: (practiceData['questions'])
          .map((practice) => PracticeQuesModel.fromJson(practice))
          .toList(),
    );
  }
}
