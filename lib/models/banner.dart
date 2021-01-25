class Banner {
  int _id;
  bool _active;
  String _filename;
  String _title;

  Banner({
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

  int get id => _id;
  bool get active => _active;
  String get filename => _filename;
  String get title => _title;
}
