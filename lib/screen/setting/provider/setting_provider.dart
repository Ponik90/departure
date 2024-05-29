import 'package:departure/screen/utils/shared_preference/shared_helper.dart';
import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  bool isTheme = true;
  String language = "english";

  Future<void> changeTheme() async {
    SharedHelper shr = SharedHelper();
    isTheme = await shr.getThemeData();
    notifyListeners();
  }

  void changeLanguage(String value) {
    language = value;
    notifyListeners();
  }
}
