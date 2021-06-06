import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/view_models/mvvm_view_model.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/view_models/mvvm_view_model_impl.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/widgets/mvvm_list.dart';
import 'package:provider/provider.dart';

class MvvmPage extends StatelessWidget {
  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'This is MVVM list',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MvvmList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<MvvmViewModel>(
      create: (ctx) => MvvmViewModelImpl(),
      dispose: (_, vm) => vm.dispose(),
      child: OrientationBuilder(
        builder: (ctx, orientation) {
          return orientation == Orientation.landscape
              ? _buildBody(context)
              : Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Mvvm',
                    ),
                  ),
                  body: _buildBody(context),
                );
        },
      ),
    );
  }
}
