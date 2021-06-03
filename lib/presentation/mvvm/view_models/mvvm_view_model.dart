import 'package:flutter/foundation.dart';
import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/models/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/mvvm_repository.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/view_modes/base_view_model.dart';

class MvvmViewModel extends BaseViewModel {
  final MvvmRepository _repository = provideMvvmRepository();
  List<MvvmItem> _mvvmItems = [];
  var _showLoading = false;
  var _isInitialized = false;

  MvvmViewModel();

  List<MvvmItem> get getMvvmItems => [..._mvvmItems];

  get isLoading => _showLoading;
  get isInitialized => _isInitialized;

  void _setLoading(bool isLoading) {
    _showLoading = isLoading;
    notifyListeners();
  }

  Future<void> loadMvvmItems() async {
    _setLoading(true);
    _mvvmItems = await _repository.getMvvmList();
    _isInitialized = true;
    _setLoading(false);
  }
}
