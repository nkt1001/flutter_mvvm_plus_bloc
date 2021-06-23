import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/base_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/bloc_repository.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_details_page.dart';

abstract class BlocItemsBloc
    extends BaseBloc<BaseBlocEvent, BlocState<List<BlocItem>>> {
  final BlocRepository blocRepository;

  BlocItemsBloc(BlocState<List<BlocItem>> state, this.blocRepository)
      : super(state);

  Stream<BlocState<List<BlocItem>>> getBlocItems(BaseBlocEvent event);

  Stream<BlocItem?> get pickedItemStream;

  void setPickedItem(BlocItem? item);

  BlocItem? get pickedItem;

  void showDetailsPage(BuildContext context);
}
