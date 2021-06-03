import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/pages/mvvm_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/start/start_page.dart';

import 'domain/enums/opened_page.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var openedPageState = OpenedPage.None;
  var isPortrait = false;

  void _onPageOpened(OpenedPage page) {
    setState(() {
      openedPageState = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return WillPopScope(
      onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: _navigatorKey,
        pages: [
          MaterialPage(
            child: StartPage(
              selectedPage: openedPageState,
              onPageSelected: (page) => _onPageOpened(page),
              isPortrait: isPortrait,
            ),
          ),
          if (isPortrait && openedPageState == OpenedPage.Mvvm)
            MaterialPage(child: MvvmPage()),
          if (isPortrait && openedPageState == OpenedPage.Bloc)
            MaterialPage(child: BlocPage()),
        ],
        onPopPage: (route, result) {
          openedPageState = OpenedPage.None;
          return route.didPop(result);
        },
      ),
    );
  }
}
