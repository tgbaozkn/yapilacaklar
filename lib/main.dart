import 'package:flutter/material.dart';
import 'package:yapilacaklar/Anasayfa/anasayfaPage.dart';
import './Onboarding/Onboarding.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yapilacaklar',
      home: MyHomePage(title: 'Yapilacaklar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database db;

  Future veritabaniAc() async {
    db = await openDatabase(
      "veritabani.db",
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("CREATE TABLE gorevler (id INTEGER PRIMARY KEY, name TEXT)");
        print("sıfırdan oluşturuldu");
      },
      onOpen: (Database db) {
        print("mevcut veritabanı açıldı");
      },
    );

    setState(() {});
  }

  @override
  void initState() {
    veritabaniAc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xfff9fcff),
      body: db == null ? Container() : Yapilacaklar(db),
    );
  }
}
