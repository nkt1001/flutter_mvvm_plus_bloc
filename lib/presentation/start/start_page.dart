import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {

  static const route = 'startPage';

  const StartPage({Key key,}) : super(key: key);

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
            onPressed: () {},
            child: Text('Mvvm Screen'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('BLoC Screen'),
          ),
        ],
      ),
    );
  }
}
