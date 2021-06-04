import 'package:flutter/foundation.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/base_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/bloc_repository.dart';

abstract class BlocItemsBloc extends BaseBloc<BlocItemsEvent, BlocState<List<BlocItem>>> {

  @protected
  final BlocRepository blocRepository;

  BlocItemsBloc(BlocState state, this.blocRepository) : super(state);

  Stream<BlocState<List<BlocItem>>> getBlocItems();
}

