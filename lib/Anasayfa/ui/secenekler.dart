import 'package:flutter/material.dart';
import 'package:yapilacaklar/Anasayfa/ui/Secenekler_buton.dart';
import 'Secenekler_buton.dart';
import 'package:sqflite/sqflite.dart';

class Secenekler extends StatefulWidget {
  Database db;
  Secenekler({this.db});
  @override
  _SeceneklerState createState() => _SeceneklerState();
}

class _SeceneklerState extends State<Secenekler> {
  String secilen = "";
  //duz kullanici gibi dusunmek.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SeceneklerButon(
              basildi: secilen == "kisisel",
              arkaplan: Color(0xffFFD506),
              color: secilen == "kisisel" ? Colors.white : Color(0xffFFD506),
              text: " Kişisel",
              func: () {
                widget.db.rawInsert(
                    "INSERT INTO gorevler(kategori) VALUES ('$secilen')");
                setState(() {
                  secilen = "kisisel";
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xff5DE61A),
              basildi: secilen == "work",
              color: secilen == "work" ? Colors.white : Color(0xff5DE61A),
              text: " İş",
              func: () {
                setState(() {
                  secilen = "work";
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xffD10263),
              basildi: secilen == "meet",
              color: secilen == "meet" ? Colors.white : Color(0xffD10263),
              text: " Buluşma",
              func: () {
                setState(() {
                  secilen = "meet";
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xff3044F2),
              basildi: secilen == "ders",
              color: secilen == "ders" ? Colors.white : Color(0xff3044F2),
              text: " Ders",
              func: () {
                setState(() {
                  secilen = "ders";
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xffF29130),
              basildi: secilen == "shopping",
              text: " Alışveriş",
              color: secilen == "shopping" ? Colors.white : Color(0xffF29130),
              func: () {
                setState(() {
                  secilen = "shopping";
                });
              }),
          SeceneklerButon(
              basildi: secilen == "party",
              text: " Parti",
              arkaplan: Color(0xff09ACCE),
              color: secilen == "party" ? Colors.white : Color(0xff09ACCE),
              func: () {
                setState(() {
                  secilen = "party";
                });
              }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

//,Text("Alışveriş"),
