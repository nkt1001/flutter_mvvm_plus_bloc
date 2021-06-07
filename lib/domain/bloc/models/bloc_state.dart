abstract class BlocState<T> {
  final T data;

  BlocState._(this.data);

  factory BlocState.loading(T data) = Loading;

  factory BlocState.error(T data, String message) = Error;

  factory BlocState.success(T data) = Success;

  factory BlocState.idle(T data) = Idle;
}

class Loading<T> extends BlocState<T> {
  Loading(T data) : super._(data);
}

class Error<T> extends BlocState<T> {
  final String message;

  Error(T data, this.message) : super._(data);
}

class Success<T> extends BlocState<T> {

  Success(T data) : super._(data);

}

class Idle<T> extends BlocState<T> {
  Idle(T data) : super._(data);

}