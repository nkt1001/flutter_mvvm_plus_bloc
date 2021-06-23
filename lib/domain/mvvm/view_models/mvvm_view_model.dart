
import 'dart:async';

import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/mvvm_repository.dart';

import 'base_view_model.dart';

abstract class MvvmViewModel extends BaseViewModel<List<MvvmItem>> {
  MvvmViewModel(this.repository);

  final MvvmRepository repository;

  Stream<MvvmItem?> get pickedItemStream;

  void setPickedItem(MvvmItem? item);

  MvvmItem? get pickedItem;

  void loadMvvmItems();
}

