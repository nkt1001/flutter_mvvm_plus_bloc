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
      onGenerateRoute: (settings) {
        print('onGenerateRoute ${settings.name}');
        late Widget widget;
        if(settings.name == StartPage.route) {
          widget = StartPage();
        } else if(settings.name == MvvmPage.route) {
          widget = MvvmPage();
        } else if(settings.name == BlocPage.route) {
          widget = BlocPage();
        } else {
          throw Exception('Unknown route ${settings.name}');
        }

        return MaterialPageRoute(
          builder: (ctx) => widget,
          settings: settings,
        );
      } ,
    );
  }
}