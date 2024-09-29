import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/repositories/practice_exercise_repo_imp.dart';
import 'package:quiz/data/repositories/question_repository_imp.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_ques_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl<Dio>()));

  sl.registerSingleton<PracticeQuesRepository>(PracticeQuesRepositoryImp(sl<ApiService>()));
  sl.registerSingleton<PracticeExerciseRepo>(PracticeExerciseRepoImp(sl<ApiService>()));

  sl.registerSingleton<GetPracticeQuesUseCase>(GetPracticeQuesUseCase(sl<PracticeQuesRepository>()));

  sl.registerFactory<PracticeQuesBloc>(() => PracticeQuesBloc(sl<GetPracticeQuesUseCase>()));
}
