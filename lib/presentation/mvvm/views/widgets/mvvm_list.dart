import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/models/result.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/view_models/mvvm_view_model.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/app_list_item.dart';
import 'package:provider/provider.dart';

class MvvmList extends StatelessWidget {
  final Function onItemTapped;

  const MvvmList({
    Key? key,
    required this.onItemTapped,
  }) : super(key: key);

  Widget _buildDataList(MvvmViewModel viewModel) {
    final data = viewModel.currentData ?? [];
    return data.isEmpty
        ? Text('Sorry, no items now. Try again later.')
        : ListView.builder(
            itemBuilder: (ctx, i) => AppListItem(
              key: ValueKey(data[i].title),
              title: data[i].title,
              onTap: onItemTapped,
            ),
            itemCount: data.length,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MvvmViewModel>(
      builder: (ctx, vm, child) {
        if(vm.currentState is Idle) {
          vm.loadMvvmItems();
        }
        return Expanded(
          child: Center(
            child: StreamBuilder<Result<List<MvvmItem>?>>(
              stream: vm.dataStream,
              initialData: vm.currentState,
              builder: (ctx, snapshot) {
                if (snapshot.data is Loading) {
                  return CircularProgressIndicator();
                } else {
                  return _buildDataList(vm);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
