import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';

abstract class BaseBloc<E, S extends BlocState> {
  final StreamController<E> _eventController = StreamController();
  final StreamController<S> _stateController = StreamController.broadcast();

  Stream<S> get state => _stateController.stream;

  final S initialState;
  StreamSubscription<E> _eventsSubscription;
  S currentState;

  BaseBloc(
    this.initialState,
  ) {
    currentState = initialState;
    _eventsSubscription = _eventController.stream.listen((E event) {
      S state = currentState;
      onReceivedEvent(event, state).forEach((S newState) {
        currentState = newState;
        _stateController.add(newState);
      });
    });
  }

  Stream<S> onReceivedEvent(
    E event,
    S currentState,
  );

  void emitEvent(E event) {
    _eventController.add(event);
  }

  void dispose() {
    _eventsSubscription.cancel();
    _eventController.close();
    _stateController.close();
  }
}
