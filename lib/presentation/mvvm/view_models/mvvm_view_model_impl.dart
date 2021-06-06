import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/models/result.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/view_models/mvvm_view_model.dart';

class MvvmViewModelImpl extends MvvmViewModel {

  MvvmViewModelImpl() : super(provideMvvmRepository()) {
    currentState = Result.idle([]);
  }

  @override
  void loadMvvmItems() async {
    currentState = Result.loading([]);
    try {
      var response = await repository.getMvvmList();
      if(response == null) {
        currentState = Error(currentData, 'Response is null');
      } else {
        currentState = Success(response);
      }
    } catch(e) {
      currentState = Error(currentData, e.toString());
    }
  }
}
