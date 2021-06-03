import 'package:mvvm_plus_bloc_flutter_app/data/impl_bloc_repo.dart';
import 'package:mvvm_plus_bloc_flutter_app/data/impl_mvvm_repository.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/bloc_repository.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/repository/mvvm_repository.dart';

BlocRepository provideBlocRepository() => BlocRepositoryImpl();

MvvmRepository provideMvvmRepository() => MvvmRepositoryImpl();