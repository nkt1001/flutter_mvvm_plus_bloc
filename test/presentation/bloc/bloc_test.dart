import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/bloc_items_bloc_impl.dart';

const idle = TypeMatcher<Idle>();
const loading = TypeMatcher<Loading>();
const success = TypeMatcher<Success>();

void main() {
  BlocItemsBloc bloc;

  group('main group', () {
    setUp(() {
      bloc = BlocItemsBlocImpl(BlocState<List<BlocItem>>.idle([]));
    });

    tearDown(() {
      bloc.dispose();
    });

    test('Checking initial state', () {
      expect(bloc.initialState, idle);
      expect(
        bloc.currentState,
        idle,
      );
    });

    test('Checking response', () async {
      expect(
        bloc.state,
        emitsInOrder([loading, success]),
      );
      bloc.emitEvent(BaseBlocEvent.init);
    });
  });
}