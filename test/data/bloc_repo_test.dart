import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_plus_bloc_flutter_app/data/commons/repository_provider.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/bloc_repository.dart';

void main() {
  late BlocRepository repository;

  setUp(() {
    repository = provideBlocRepository();
  });

  test('Check bloc repo response', () async {
    final list = await repository.getBlocList();
    expect(list.isNotEmpty, true);
  });
}