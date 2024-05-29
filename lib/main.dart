import 'package:departure/screen/home/provider/home_provider.dart';
import 'package:departure/screen/setting/provider/setting_provider.dart';

import 'package:departure/screen/utils/routes/app_routes.dart';
import 'package:departure/screen/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SettingProvider(),
        ),
      ],
      child: Consumer<SettingProvider>(builder: (context, value, child) {
        value.changeTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightThemeMode,
          darkTheme: darkThemeMode,
          themeMode: value.isTheme == true ? ThemeMode.light : ThemeMode.dark,
          routes: screen,
        );
      }),
    ),
  );
}
