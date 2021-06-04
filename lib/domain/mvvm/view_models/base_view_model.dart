import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/models/result.dart';

abstract class BaseViewModel<T> {

  bool isDisposed = false;
  final _dataStreamController = StreamController<Result<T>>.broadcast();
  Stream<Result<T>> get dataStream => _dataStreamController.stream;
  Result<T> _currentState;

  get currentState => _currentState;
  get currentData => _currentState.data;

  @protected
  set currentState(Result<T> value) {
    _currentState = value;
    if(isDisposed) {
      return;
    }
    _dataStreamController.add(value);
  }


  @mustCallSuper
  void dispose() {
    isDisposed = true;
    _dataStreamController.close();
  }
}