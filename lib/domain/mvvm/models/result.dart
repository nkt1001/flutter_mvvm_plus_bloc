abstract class Result<T> {
  final T data;

  Result._(this.data);

  factory Result.loading(T data) = Loading;

  factory Result.error(T data, String message) = Error;

  factory Result.success(T data) = Success;

  factory Result.idle(T data) = Idle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result && runtimeType == other.runtimeType && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class Loading<T> extends Result<T> {

  Loading(T data) : super._(data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Loading && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class Error<T> extends Result<T> {
  final String message;

  Error(T data, this.message) : super._(data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Error &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => super.hashCode ^ message.hashCode;
}

class Success<T> extends Result<T> {

  Success(T data) : super._(data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Success && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class Idle<T> extends Result<T> {

  Idle(T data) : super._(data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Idle && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}