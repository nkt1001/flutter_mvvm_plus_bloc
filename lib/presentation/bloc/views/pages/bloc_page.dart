import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/bloc_items_bloc.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/bloc/models/bloc_state.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/bloc_items_bloc_impl.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_details_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/widgets/bloc_details.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/widgets/bloc_list.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/nested_navigator.dart';
import 'package:provider/provider.dart';

class BlocPage extends StatelessWidget {
  static const route = '/bloc';

  BlocPage({
    Key? key,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Provider<BlocItemsBloc>(
      create: (ctx) => BlocItemsBlocImpl(BlocState.idle([])),
      dispose: (_, bloc) => bloc.dispose(),
      child: NestedNavigator(
        initialRoute: BlocPage.route,
        onGenerateRoute: (settings) {
          late Widget widget;
          if (settings.name == BlocPage.route) {
            widget = BlocHome();
          } else if (settings.name == BlocDetailsPage.route) {
            widget = BlocDetailsPage();
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

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BlocItemsBloc>(context, listen: false);

    return OrientationBuilder(
      builder: (ctx, orientation) {
        final pickedItem = bloc.pickedItem;
        if (pickedItem != null && orientation == Orientation.portrait) {
          bloc.showDetailsPage(context);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Mvvm',
            ),
          ),
          body: _buildBody(context, bloc, orientation == Orientation.landscape),
        );
      },
    );
  }

  Widget _buildBody(
      BuildContext context,
      BlocItemsBloc bloc,
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
                BlocList(
                  onItemTapped: (item) => onItemTapped(
                      context,
                      bloc,
                      bloc.currentState.data
                          .firstWhere((element) => element.title == item),
                      isLandscape),
                ),
              ],
            ),
            flex: 1,
          ),
          if (isLandscape)
            StreamBuilder<BlocItem?>(
              initialData: bloc.pickedItem,
              stream: bloc.pickedItemStream,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Expanded(
                    child: BlocDetailsWidget(
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
      BlocItemsBloc bloc,
      BlocItem item,
      bool isLandscape,
      ) {
    bloc.setPickedItem(item);
    if (!isLandscape) {
      bloc.showDetailsPage(context);
    }
  }
}
