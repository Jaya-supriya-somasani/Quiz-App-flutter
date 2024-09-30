import 'package:dio/dio.dart';

abstract class DataState<T> {
  final dynamic data;
  final String? error;

  const DataState({this.data, this.error});
}

class DataSuccessState<T> extends DataState<T> {
  const DataSuccessState(T data) : super(data: data);
}

class DataFailedState<T> extends DataState<T> {
  const DataFailedState(String error) : super(error: error);
}
