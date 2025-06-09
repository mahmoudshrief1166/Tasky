import 'package:flutter/material.dart';
import 'package:tasky/core/services/perefernces_manager.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class SplashController extends ChangeNotifier {
  final PereferncesManager _prefsManager = PereferncesManager();

  String _username = '';
  String get username => _username;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> initApp() async {
    _isLoading = true;
    notifyListeners();
    await _prefsManager.init();
    ThemeController().init();
    _username = _prefsManager.getString('username') ?? '';
    _isLoading = false;
    notifyListeners();
  }
}
