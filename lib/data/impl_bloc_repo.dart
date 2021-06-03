import 'package:mvvm_plus_bloc_flutter_app/domain/models/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/bloc_repository.dart';

class BlocRepositoryImpl extends BlocRepository {
  @override
  Future<List<BlocItem>> getBlocList() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(400, (index) => BlocItem('BLoC item $index'));
  }

}