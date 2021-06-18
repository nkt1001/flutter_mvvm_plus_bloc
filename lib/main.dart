import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/pages/mvvm_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/start/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const route = '/home';
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: _navigatorKey,
        initialRoute: MyHomePage.route,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case MyHomePage.route:
              return MaterialPageRoute(builder: (ctx) => StartPage());
            case MvvmPage.route:
              return MaterialPageRoute(builder: (ctx) => MvvmPage());
            case BlocPage.route:
              return MaterialPageRoute(builder: (ctx) => BlocPage());
            default:
              return null;
          }
        },
      ),
    );
  }
}
