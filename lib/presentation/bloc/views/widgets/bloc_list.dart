import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/business/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/app_list_item.dart';

class BlocList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: BlocBuilder<BlocItemsBloc, BlocItemsState>(builder: (_, state) {
          if (state is LoadedBlocItemsState) {
            return state.blocItems.isEmpty
                ? Text('Sorry, no items now. Try again later.')
                : ListView.builder(
                    itemBuilder: (ctx, i) => AppListItem(
                      key: ValueKey(state.blocItems[i].title),
                      title: state.blocItems[i].title,
                    ),
                    itemCount: state.blocItems.length,
                  );
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
