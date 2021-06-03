import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/models/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/bloc_repository.dart';

class BlocItemsBloc extends Bloc<BlocItemsEvent, BlocItemsState> {

  BlocRepository _blocRepository = provideBlocRepository();

  BlocItemsBloc() : super(InitialBlocItemsState());

  @override
  Stream<BlocItemsState> mapEventToState(BlocItemsEvent event) async* {
    if(event == BlocItemsEvent.init) {
      yield LoadedBlocItemsState(await _blocRepository.getBlocList());
    }
  }
}

enum BlocItemsEvent {
  init
}

abstract class BlocItemsState {}

class InitialBlocItemsState extends BlocItemsState {}

class LoadedBlocItemsState extends BlocItemsState {
  final List<BlocItem> blocItems;

  LoadedBlocItemsState(this.blocItems);
}