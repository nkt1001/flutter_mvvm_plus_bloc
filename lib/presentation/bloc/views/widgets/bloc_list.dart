import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_events.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/app_list_item.dart';
import 'package:provider/provider.dart';

class BlocList extends StatelessWidget {
  Widget _buildBlocList(List<BlocItem> data) {
    return data.isEmpty
        ? Text('Sorry, no items now. Try again later.')
        : ListView.builder(
      itemBuilder: (ctx, i) => AppListItem(
        key: ValueKey(data[i].title),
        title: data[i].title,
      ),
      itemCount: data.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlocItemsBloc>(builder: (ctx, bloc, child) {
      bloc.emitEvent(BaseBlocEvent.init);

      return Expanded(
        child: Center(
          child: StreamBuilder<BlocState<List<BlocItem>>>(
              stream: bloc.state,
              initialData: bloc.currentState,
              builder: (_, state) {
                if (state.data is Loading || state.data is Idle) {
                  return CircularProgressIndicator();
                } else {
                  return _buildBlocList(state.data.data);
                }
              }),
        ),
      );
    });
  }
}
