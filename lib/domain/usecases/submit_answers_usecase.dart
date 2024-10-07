import 'package:quiz/data/models/submit_answer_response.dart';
import 'package:quiz/domain/repositories/submit_answers_repo.dart';
import 'package:quiz/utils/data_state.dart';
import 'package:quiz/utils/usecase.dart';

class SubmitAnswersUseCase implements UseCase<dynamic,void>{

  final SubmitAnswersRepo submitAnswersRepo;

  SubmitAnswersUseCase(this.submitAnswersRepo);
  @override
  Future<dynamic> call({void params}) async{
    final response= await submitAnswersRepo.submitAnswerData();
    if(response is DataSuccessState<SubmitAnswerResponse>){
      print("response.data.data--- ${response.data.data}");
      return response.data.data;
    }else{
      throw Exception("Error in Submit answer Usecase");
    }
  }
}