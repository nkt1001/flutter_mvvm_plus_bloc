import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/models/result.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/view_models/mvvm_view_model.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/view_models/mvvm_view_model_impl.dart';

const idle = TypeMatcher<Idle>();
const loading = TypeMatcher<Loading>();
const success = TypeMatcher<Success>();

void main() {
  MvvmViewModel viewModel;

  group('main group', () {
    setUp(() {
      viewModel = MvvmViewModelImpl();
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('Checking initial state', () {
      expect(viewModel.currentData, <MvvmItem>[]);
      expect(
        viewModel.currentState,
        idle,
      );
    });

    test('Checking response', () async {
      expect(
        viewModel.dataStream,
        emitsInOrder([loading, success]),
      );
      viewModel.loadMvvmItems();
    });
  });
}
