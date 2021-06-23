import 'package:flutter/widgets.dart';

class NestedNavigator extends StatefulWidget {

  const NestedNavigator({
    Key? key,
    required this.initialRoute,
    required this.onGenerateRoute,
    this.onEmptyStack,
  }) : super(key: key);

  final String initialRoute;
  final RouteFactory onGenerateRoute;

  final bool Function()? onEmptyStack;

  @override
  _NestedNavigatorState createState() => _NestedNavigatorState();

  static _NestedNavigatorState? of(BuildContext context) {
    return context.findAncestorStateOfType<_NestedNavigatorState>();
  }
}

class _NestedNavigatorState extends State<NestedNavigator> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isNestedPopHandled = await navigatorKey.currentState!.maybePop();

        final onEmptyStack = widget.onEmptyStack;
        if (!isNestedPopHandled && onEmptyStack != null) {
          final isHandledEmptyStackPop = onEmptyStack();
          return !isHandledEmptyStackPop;
        }

        return !isNestedPopHandled;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: widget.initialRoute,
        onGenerateRoute: widget.onGenerateRoute,
      ),
    );
  }

  void popStack<T extends Object>([T? result]) {
    Navigator.of(context).pop(result);
  }
}