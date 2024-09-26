import 'package:quiz/data/models/practice_ques_model.dart';

class DataWrapper {
  final List<PracticeQuesModel> practiceQuesModel;

  DataWrapper({required this.practiceQuesModel});

  factory DataWrapper.fromJson(Map<String, dynamic> json) {
    return DataWrapper(
      // Properly map each item in the 'practice' list to a PracticeQuesModel object
      practiceQuesModel: (json['practice'] as List)
          .map((practice) => PracticeQuesModel.fromJson(practice))
          .toList(),
    );
  }
}
