import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/mvvm/view_models/mvvm_view_model.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/nested_navigator.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/view_models/mvvm_view_model_impl.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/pages/mvvm_page_details.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/widgets/mvvm_details.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/widgets/mvvm_list.dart';
import 'package:provider/provider.dart';

class MvvmPage extends StatelessWidget {
  static const route = '/mvvm';

  MvvmPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Provider<MvvmViewModel>(
      create: (ctx) => MvvmViewModelImpl(),
      dispose: (_, vm) => vm.dispose(),
      child: NestedNavigator(
        initialRoute: MvvmPage.route,
        onGenerateRoute: (settings) {
          late Widget widget;
          if (settings.name == MvvmPage.route) {
            widget = MvvmHome();
          } else if (settings.name == MvvmDetailsPage.route) {
            widget = MvvmDetailsPage();
          } else {
            return null;
          }
          return MaterialPageRoute(
            builder: (ctx) => widget,
            settings: settings,
          );
        },
      ),
    );
  }
}

class MvvmHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MvvmViewModel>(context, listen: false);

    return OrientationBuilder(
      builder: (ctx, orientation) {
        final pickedItem = vm.pickedItem;
        if (pickedItem != null && orientation == Orientation.portrait) {
          showDetailsPage(context, vm, pickedItem);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Mvvm',
            ),
          ),
          body: _buildBody(context, vm, orientation == Orientation.landscape),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    MvvmViewModel vm,
    bool isLandscape,
  ) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
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
                MvvmList(
                  onItemTapped: (item) => onItemTapped(
                      context,
                      vm,
                      vm.currentData!
                          .firstWhere((element) => element.title == item),
                      isLandscape),
                ),
              ],
            ),
            flex: 1,
          ),
          if (isLandscape)
            StreamBuilder<MvvmItem?>(
              initialData: vm.pickedItem,
              stream: vm.pickedItemStream,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Expanded(
                    child: MvvmDetailsWidget(
                      details: 'Mvvm item details: ${snapshot.data!.title}',
                    ),
                    flex: 2,
                  );
                } else {
                  return Container();
                }
              },
            ),
        ],
      ),
    );
  }

  onItemTapped(
    BuildContext context,
    MvvmViewModel viewModel,
    MvvmItem item,
    bool isLandscape,
  ) {
    viewModel.setPickedItem(item);
    if (!isLandscape) {
      showDetailsPage(context, viewModel, item);
    }
  }

  void showDetailsPage(
    BuildContext context,
    MvvmViewModel viewModel,
    MvvmItem item,
  ) {
    Future.microtask(() => Navigator.of(context)
            .pushNamed(MvvmDetailsPage.route, arguments: item)
            .then((value) {
          viewModel.setPickedItem(null);
        }));
  }
}
