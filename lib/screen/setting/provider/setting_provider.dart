import 'package:flutter/material.dart';

import '../../../utils/shared_preference/shared_helper.dart';

class SettingProvider with ChangeNotifier {
  bool isTheme = true;
  String language = "english";

  Future<void> changeTheme() async {
    SharedHelper shr = SharedHelper();
    if(await shr.getThemeData() != null)
      {
        isTheme = (await shr.getThemeData())!;
      }
    else
    {
      isTheme = true;
    }
    notifyListeners();
  }

  void changeLanguage(String value) {
    language = value;
    notifyListeners();
  }
}
