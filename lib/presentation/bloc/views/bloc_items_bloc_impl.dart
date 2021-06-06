import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';

class BlocItemsBlocImpl extends BlocItemsBloc {
  BlocItemsBlocImpl(BlocState state) : super(state, provideBlocRepository());

  @override
  Stream<BlocState<List<BlocItem>>> getBlocItems(BaseBlocEvent event) async* {
    yield BlocState.loading(currentState.data);
    try {
      var response = await blocRepository.getBlocList();
      if (response == null) {
        yield BlocState.error(currentState.data, 'Response is null');
      } else {
        yield BlocState.success(response);
      }
    } catch (e) {
      yield BlocState.error(currentState.data, e.toString());
    }
  }

  @override
  Stream<BlocState<List<BlocItem>>> onReceivedEvent(
      BaseBlocEvent event, BlocState<List<BlocItem>> currentState) async* {
    if (event == BaseBlocEvent.init) {
      yield* getBlocItems(event);
    }
  }
}
