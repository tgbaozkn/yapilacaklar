class Gorev {
  String id;
  String title;
  String date;
  int durum;
  Gorev({this.id, this.date, this.durum, this.title});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['durum'] = durum;
    map['date'] = date;

    return map;
  }

  Gorev.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.durum = map['durum'];
    this.date = map['date'];
  }
}
