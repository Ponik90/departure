import 'dart:convert';

import 'package:departure/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<HomeModel>> bhagavadJson() async {
    String bhagavadString =
        await rootBundle.loadString("assets/json/bhagvad_gita.json");

    List gitaJson = jsonDecode(bhagavadString);

    List<HomeModel> l1 =
        gitaJson.map((e) => HomeModel.mapToModel(e)).toList();

    return l1;
  }
}
