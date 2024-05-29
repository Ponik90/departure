import 'package:departure/screen/home/view/home_screen.dart';
import 'package:departure/screen/setting/view/setting_screen.dart';
import 'package:flutter/material.dart';

import '../../chapter/view/chapter_screen.dart';
import '../../splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'chapter': (context) => const ChapterScreen(),
  'setting': (context) => const SettingScreen(),
};
