class Bannerr {
  int _id;
  bool _active;
  String _filename;
  String _title;

  int get id => _id;
  bool get active => _active;
  String get filename => _filename;
  String get title => _title;

  Bannerr({
    int id,
    String active,
    String filename,
    String title,
  }) {
    _id = id;
    _active = active == "1";
    _filename = filename;
    _title = title;
  }

  factory Bannerr.fromJson(Map<String, dynamic> json) {
    return Bannerr(
      id: int.parse(json["id"]),
      active: json["active"],
      filename: json["filename"],
      title: json["title"],
    );
  }
}
