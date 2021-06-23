import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_details_page.dart';

class BlocItemsBlocImpl extends BlocItemsBloc {
  BlocItemsBlocImpl(BlocState<List<BlocItem>> state)
      : super(state, provideBlocRepository());

  BlocItem? _pickedItem;
  StreamController<BlocItem?> _pickedItemStreamController =
      StreamController.broadcast();

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
      if(currentState is Idle) {
        yield* getBlocItems(event);
      }
    }
  }

  @override
  void showDetailsPage(BuildContext context) {
    Future.microtask(() => Navigator.of(context)
            .pushNamed(BlocDetailsPage.route, arguments: pickedItem)
            .then((value) {
          setPickedItem(null);
        }));
  }

  @override
  BlocItem? get pickedItem => _pickedItem;

  @override
  Stream<BlocItem?> get pickedItemStream => _pickedItemStreamController.stream;

  @override
  void setPickedItem(BlocItem? item) {
    if (_pickedItem == item) {
      return;
    }

    _pickedItem = item;
    _pickedItemStreamController.sink.add(item);
  }

  @override
  void dispose() {
    super.dispose();
    _pickedItemStreamController.close();
  }
}
