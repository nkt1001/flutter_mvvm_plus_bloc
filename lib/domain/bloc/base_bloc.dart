import 'dart:async';

import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BlocState> {
  final StreamController<E> _eventController = StreamController();
  final StreamController<S> _stateController = StreamController.broadcast();
  bool isDisposed = false;

  Stream<S> get state => _stateController.stream;

  final S initialState;
  late StreamSubscription<E> _eventsSubscription;
  late S currentState;

  BaseBloc(
    this.initialState,
  ) {
    currentState = initialState;
    _eventsSubscription = _eventController.stream.listen((E event) {
      S state = currentState;
      onReceivedEvent(event, state).forEach((S newState) {
        if(isDisposed) {
          return;
        }
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
    isDisposed = true;
    _eventsSubscription.cancel();
    _eventController.close();
    _stateController.close();
  }
}
