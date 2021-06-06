import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';

abstract class BlocRepository {
  Future<List<BlocItem>> getBlocList();
}