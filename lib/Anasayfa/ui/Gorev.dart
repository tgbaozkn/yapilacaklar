class Gorev {
  int id;
  String title;
  String date;
  int durum;
  String kategori;
  int can;
  static const String TABLENAME = "gorevler";
  Gorev({this.id, this.date, this.durum, this.title, this.kategori, this.can});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['durum'] = durum;
    map['date'] = date;
    map['kategori'] = kategori;
    map['can'] = can;

    return map;
  }

  Gorev.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.durum = map['durum'];
    this.date = map['date'];
    this.kategori = map['kategori'];
    this.can = map["can"];
  }
}
