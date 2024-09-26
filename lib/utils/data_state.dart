import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({this.data, this.error});
}

class DataSuccessState<T> extends DataState<T> {
  const DataSuccessState(T data) : super(data: data);
}

class DataFailedState<T> extends DataState<T> {
  const DataFailedState(DioError error) : super(error: error);
}
