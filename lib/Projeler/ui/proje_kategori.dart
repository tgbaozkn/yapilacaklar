import 'dart:ui';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../../Anasayfa/ui/Gorev.dart';

class ProjeKategori extends StatefulWidget {
  String text;
  Function close;
  Database db;
  String kategori;

  List<Gorev> projeList = [];

  ProjeKategori(
      {this.text, this.close, this.db, this.projeList, this.kategori});
  @override
  _ProjeKategoriState createState() => _ProjeKategoriState();
}

class _ProjeKategoriState extends State<ProjeKategori> {
  Color getHangiColor(String kategori) {
    switch (kategori) {
      case "kisisel":
        return Color(0xffFFD506);
        break;
      case "work":
        return Color(0xff5DE61A);
        break;
      case "meet":
        return Color(0xffD10263);
        break;
      case "ders":
        return Color(0xff3044F2);
        break;
      case "shopping":
        return Color(0xffF29130);
        break;
      case "party":
        return Color(0xff09ACCE);
        break;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
      height: boy * 0.9,
      width: en * 0.9,
      color: getHangiColor(widget.kategori).withOpacity(0.2),
      child: Column(
        children: [
          Container(
            width: en,
            height: boy * 0.05,
            padding: EdgeInsets.only(
              left: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getHangiColor(widget.kategori).withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 9,
                      color: Colors.white.withOpacity(0.8),
                      offset: Offset(0, 4))
                ]),
            child: Row(
              children: [
                SizedBox(
                  width: widget.text.length < 7 ? en * 0.18 : en * 0.1,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: boy * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: en * 0.4,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.black,
                  ),
                  onPressed: widget.close,
                )
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: widget.projeList.map((proje) {
              return proje.kategori == widget.kategori
                  ? Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.white.withOpacity(0.9),
                      width: en * 0.9,
                      height: boy * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_right,
                            color: Color(0xff554E8F).withOpacity(0.5),
                            size: 30,
                            textDirection: TextDirection.ltr,
                          ),
                          Center(
                              child: Text(proje.title,
                                  style: TextStyle(
                                      fontSize: boy * 0.022,
                                      fontFamily: 'Rubik-Medium',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff554E8F)))),
                        ],
                      ),
                    )
                  : Container();
            }).toList(),
          )
        ],
      ),
    );
  }
}
