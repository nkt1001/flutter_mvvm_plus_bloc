abstract class Result<T> {
  final T data;

  Result._(this.data);

  factory Result.loading(T data) = Loading;

  factory Result.error(T data, String message) = Error;

  factory Result.success(T data) = Success;

  factory Result.idle(T data) = Idle;
}

class Loading<T> extends Result<T> {

  Loading(T data) : super._(data);
}

class Error<T> extends Result<T> {
  final String message;

  Error(T data, this.message) : super._(data);
}

class Success<T> extends Result<T> {

  Success(T data) : super._(data);
}

class Idle<T> extends Result<T> {

  Idle(T data) : super._(data);
}