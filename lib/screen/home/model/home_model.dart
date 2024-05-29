class HomeModel {
  String? chapter_3, chapter_2, chapter, url;
  int? chapter_id, verses_no;
  List? verses = [];
  List? english = [];
  List? gujrati = [];

  HomeModel(
      {this.chapter_2,
      this.chapter_3,
      this.chapter,
      this.chapter_id,
      this.verses_no,
      this.verses,
      this.english,
      this.gujrati,
      this.url});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      chapter_3: m1['chapter 3'],
        url: m1['url'],
        gujrati: m1['gujrati'],
        verses: m1['verses'],
        verses_no: m1['verses_no'],
        chapter_2: m1['chapter 2'],
        chapter_id: m1['chapter_id'],
        english: m1['english'],
        chapter: m1['chapter']);
  }
}
