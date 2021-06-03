import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/enums/opened_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/pages/bloc_page.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/pages/mvvm_page.dart';

class StartPage extends StatelessWidget {
  final OpenedPage selectedPage;
  final ValueChanged onPageSelected;
  final bool isPortrait;

  const StartPage({
    Key key,
    @required this.selectedPage,
    @required this.isPortrait,
    @required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
      ),
      body: isPortrait
          ? StartButtonsList(onPageSelected)
          : Row(
              children: [
                Expanded(
                  child: StartButtonsList(onPageSelected),
                  flex: 1,
                ),
                if (selectedPage == OpenedPage.Bloc)
                  Expanded(
                    child: BlocPage(),
                    flex: 2,
                  ),
                if (selectedPage == OpenedPage.Mvvm)
                  Expanded(
                    child: MvvmPage(),
                    flex: 2,
                  ),
              ],
            ),
    );
  }
}

class StartButtonsList extends StatelessWidget {
  final ValueChanged onOpenPageClicked;

  const StartButtonsList(this.onOpenPageClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => onOpenPageClicked(OpenedPage.Mvvm),
            child: Text('Mvvm Screen'),
          ),
          ElevatedButton(
            onPressed: () => onOpenPageClicked(OpenedPage.Bloc),
            child: Text('BLoC Screen'),
          ),
        ],
      ),
    );
  }
}
