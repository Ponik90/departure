import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  Future<void> setThemeData(bool themeData) async {
    SharedPreferences chaneTheme = await SharedPreferences.getInstance();
    await chaneTheme.setBool('true', themeData);
  }

  Future<bool> getThemeData() async {
    bool? data;
    SharedPreferences chaneTheme = await SharedPreferences.getInstance();
    data = chaneTheme.getBool('true')!;
    return data;
  }


}
