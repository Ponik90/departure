import 'package:flutter/material.dart';

import '../../../utils/helper/json_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier
{

  JsonHelper helper =JsonHelper();
  List<HomeModel> gitaList = [];

  Future<void> getGitaJson()
  async {
    gitaList = await helper.bhagavadJson();
    notifyListeners();
  }
}