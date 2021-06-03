import 'package:mvvm_plus_bloc_flutter_app/domain/models/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/mvvm_repository.dart';

class MvvmRepositoryImpl extends MvvmRepository {
  @override
  Future<List<MvvmItem>> getMvvmList() async {
    await Future.delayed(const Duration(seconds: 5));
    return List.generate(1000, (index) => MvvmItem('Mvvm item $index'));
  }

}