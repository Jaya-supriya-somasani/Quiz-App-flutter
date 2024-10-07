import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/data/repositories/practice_exercise_repo_imp.dart';
import 'package:quiz/data/repositories/question_repository_imp.dart';
import 'package:quiz/data/repositories/submit_answers_repo_imp.dart';
import 'package:quiz/domain/repositories/practice_exercise_repo.dart';
import 'package:quiz/domain/repositories/practice_ques_repository.dart';
import 'package:quiz/domain/usecases/practice_exercise_usecase.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/domain/usecases/submit_answers_usecase.dart';
import 'package:quiz/presentation/bloc/practice_exercise/practice_exercise_bloc.dart';
import 'package:quiz/presentation/bloc/practice_ques/practice_ques_bloc.dart';
import 'package:quiz/presentation/bloc/submit_answers/submit_answer_bloc.dart';
import 'domain/repositories/submit_answers_repo.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl<Dio>()));

  sl.registerSingleton<PracticeQuesRepository>(PracticeQuesRepositoryImp(sl<ApiService>()));
  sl.registerLazySingleton<PracticeExerciseRepoImp>(() => PracticeExerciseRepoImp(sl.get<ApiService>()));
  sl.registerSingleton<PracticeExerciseRepo>(PracticeExerciseRepoImp(sl<ApiService>()));
  sl.registerLazySingleton<SubmitAnswersRepo>(()=>SubmitAnswerRepoImp(sl.get<ApiService>()));

  //Use case dependencies
  sl.registerSingleton<GetPracticeQuesUseCase>(GetPracticeQuesUseCase(sl<PracticeQuesRepository>()));
  sl.registerSingleton<GetPracticeExerciseUseCase>(GetPracticeExerciseUseCase(sl<PracticeExerciseRepo>()));
  sl.registerSingleton<SubmitAnswersUseCase>(SubmitAnswersUseCase(sl<SubmitAnswersRepo>()));

  // Bloc dependencies
  sl.registerFactory<PracticeQuesBloc>(() => PracticeQuesBloc(sl<GetPracticeQuesUseCase>()));
  sl.registerFactory<PracticeExerciseBloc>(() => PracticeExerciseBloc(sl<GetPracticeExerciseUseCase>()));
  sl.registerFactory<SubmitAnswersBloc>(() => SubmitAnswersBloc(sl<SubmitAnswersUseCase>()));
}