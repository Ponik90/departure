import 'package:departure/utils/shared_preference/shared_helper.dart';
import 'package:flutter/material.dart';

class ChapterProvider with ChangeNotifier {
  List<String> likeList = [];
  SharedHelper shr = SharedHelper();

  Future<void> setLikeData(String likeVerse) async {
    List<String>? data = await shr.getLike();
    if (data != null) {
      data.add(likeVerse);
      shr.setLike(data);
    } else {
      shr.setLike([likeVerse]);
    }
    notifyListeners();
  }

  Future<void> getLikeData() async {
    var list = await shr.getLike();
    if (list != null) {
      likeList = list;
      notifyListeners();
    }
  }

  void deleteVerse(int index) {
    likeList.removeAt(index);
    shr.setLike(likeList);
    notifyListeners();
  }
}
