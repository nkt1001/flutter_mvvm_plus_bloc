import 'package:mvvm_plus_bloc_flutter_app/domain/models/mvvm_item.dart';

abstract class MvvmRepository {
  Future<List<MvvmItem>> getMvvmList();
}