import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:quiz/data/data_sources/remote/api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));

}
