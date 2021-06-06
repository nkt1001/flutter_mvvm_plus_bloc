import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/opened_page.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var openedPageState = OpenedPage.None;

  void _onPageOpened(OpenedPage page) {
    setState(() {
      openedPageState = page;
    });
  }

  bool _isPortrait(Orientation orientation) => orientation == Orientation.portrait;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => !await _navigatorKey.currentState.maybePop(),
      child: OrientationBuilder(
        builder: (ctx, orientation) => Navigator(
          key: _navigatorKey,
          pages: [
            MaterialPage(
              child: StartPage(
                selectedPage: openedPageState,
                onPageSelected: (page) => _onPageOpened(page),
                isPortrait: _isPortrait(orientation),
              ),
            ),
            if (_isPortrait(orientation) && openedPageState == OpenedPage.Mvvm)
              MaterialPage(child: MvvmPage()),
            if (_isPortrait(orientation) && openedPageState == OpenedPage.Bloc)
              MaterialPage(child: BlocPage()),
          ],
          onPopPage: (route, result) {
            openedPageState = OpenedPage.None;
            return route.didPop(result);
          },
        ),
      ),
    );
  }
}
