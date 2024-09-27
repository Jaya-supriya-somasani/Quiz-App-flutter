import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:quiz/data/data_sources/remote/api_service.dart';
import 'package:quiz/domain/usecases/practice_ques_usecase.dart';
import 'package:quiz/presentation/bloc/practice_ques_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerFactory<PracticeQuesBloc>(() => PracticeQuesBloc(sl()));

  sl.registerSingleton(GetPracticeQuesUseCase(sl()));
}
