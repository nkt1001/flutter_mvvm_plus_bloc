import 'package:flutter/foundation.dart';

class SilentChangeNotifier extends ChangeNotifier {

  bool _wasDisposed = false;

  @override
  void dispose() {
    _wasDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if(_wasDisposed) {
      return;
    }

    super.notifyListeners();
  }
}