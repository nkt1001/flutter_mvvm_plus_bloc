import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';

abstract class MvvmRepository {
  Future<List<MvvmItem>> getMvvmList();
}