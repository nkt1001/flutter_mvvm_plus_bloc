import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/bloc_items_bloc_impl.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/widgets/bloc_list.dart';
import 'package:provider/provider.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if(isLandscape) {
      return _buildBody(context);
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'BLoC',
          ),
        ),
        body: _buildBody(context),
      );
    }
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'This is BLoC list',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Provider<BlocItemsBloc>(
            create: (_) => BlocItemsBlocImpl(BlocState.idle([])),
            dispose: (_, bloc) {
              bloc.dispose();
            },
            child: BlocList(),
          ),
        ],
      ),
    );
  }
}
