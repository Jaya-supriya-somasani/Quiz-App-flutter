abstract class DataState<T> {}

class DataSuccessState<T> extends DataState<T> {
  final T data;
  DataSuccessState(this.data);
}

class DataFailedState<T> extends DataState<T> {
  final String error;
  DataFailedState(this.error);
}
