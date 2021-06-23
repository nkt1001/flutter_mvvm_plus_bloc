import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/common/widgets/nested_navigator.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/pages/mvvm_page.dart';

class StartPage extends StatelessWidget {
  static const route = '/';

  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
      ),
      body: StartButtonsList(),
    );
  }
}

class StartButtonsList extends StatelessWidget {
  const StartButtonsList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => onStartButtonClicked(context, true),
            child: Text('Mvvm Screen'),
          ),
          ElevatedButton(
            onPressed: () => onStartButtonClicked(context, false),
            child: Text('BLoC Screen'),
          ),
        ],
      ),
    );
  }

  void onStartButtonClicked(BuildContext context, bool mvvm) {
    final name;
    if (mvvm) {
      name = MvvmPage.route;
    } else {
      name = BlocPage.route;
    }
    Navigator.of(context).pushNamed(name);
  }
}
