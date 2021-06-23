import 'dart:async';

import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/models/result.dart';

abstract class BaseViewModel<T> {

  bool isDisposed = false;
  final _dataStreamController = StreamController<Result<T?>>.broadcast();
  Stream<Result<T?>> get dataStream => _dataStreamController.stream;
  Result<T?> _currentState = Result.idle(null);

  Result<T?> get currentState => _currentState;
  T? get currentData => _currentState.data;

  set currentState(Result<T?> value) {
    _currentState = value;
    if(isDisposed) {
      return;
    }
    _dataStreamController.add(value);
  }

  void dispose() {
    isDisposed = true;
    _dataStreamController.close();
  }
}