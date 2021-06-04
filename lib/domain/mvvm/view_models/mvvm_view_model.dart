
import 'package:flutter/foundation.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/mvvm_repository.dart';

import 'base_view_model.dart';

abstract class MvvmViewModel extends BaseViewModel<List<MvvmItem>> {
  @protected
  final MvvmRepository repository;

  MvvmViewModel(this.repository);

  void loadMvvmItems();
}

