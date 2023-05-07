import 'package:flutter/cupertino.dart';

class ProviderDetailsQuery extends ChangeNotifier {
  bool _statusTextField = false;
  bool get statusTextField => _statusTextField;

  void addStatus(bool status) {
    _statusTextField = status;
    notifyListeners();
  }

  void disposeValues() {
    _statusTextField = false;
    notifyListeners();
  }
}