import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/app_list_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/view_models/mvvm_view_model.dart';
import 'package:provider/provider.dart';

class MvvmList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MvvmViewModel>(context);

    return Expanded(
      child: Center(
        child: vm.isLoading
            ? CircularProgressIndicator()
            : vm.getMvvmItems.isEmpty && vm.isInitialized
                ? Text('Sorry, no items now. Try again later.')
                : ListView.builder(
                    itemBuilder: (ctx, i) => AppListItem(
                      key: ValueKey(vm.getMvvmItems[i].title),
                      title: vm.getMvvmItems[i].title,
                    ),
                    itemCount: vm.getMvvmItems.length,
                  ),
      ),
    );
  }
}
