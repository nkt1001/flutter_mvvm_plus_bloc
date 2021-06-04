import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';

class BlocItemsBlocImpl extends BlocItemsBloc {
  BlocItemsBlocImpl(BlocState state) : super(state, provideBlocRepository());

  @override
  Stream<BlocState<List<BlocItem>>> getBlocItems() {
    // TODO: implement getBlocItems
    throw UnimplementedError();
  }

  @override
  Stream<BlocState<List<BlocItem>>> onReceivedEvent(BlocItemsEvent event, BlocState<List<BlocItem>> currentState) {
    // TODO: implement onReceivedEvent
    throw UnimplementedError();
  }


}