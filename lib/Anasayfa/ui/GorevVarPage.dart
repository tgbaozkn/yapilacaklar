import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Projeler/ui/appbar2.dart';
import 'Gorev.dart';
import 'package:sqflite/sqflite.dart';

class GorevVarPage extends StatefulWidget {
  //rename symbol
  List<Gorev> gorevler;
  Database db;
  Function getGorevler;
  GorevVarPage({
    this.gorevler,
    this.db,
    this.getGorevler,
  });
  @override
  _GorevVarPageState createState() => _GorevVarPageState();
}

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

Icon getHangiDurum(int durum) {
  switch (durum) {
    case 0:
      return Icon(Icons.check_circle);
      break;
    case 1:
      return Icon(Icons.gps_not_fixed);
      break;
    default:
      return Icon(
        Icons.gps_not_fixed,
      );
  }
}

Color durumRengi(int durum) {
  switch (durum) {
    case 0:
      return Color(0xff91DC5A);
      break;
    case 1:
      return Color(0xffD9D9D9);
      break;
    default:
      return Color(0xffD9D9D9);
  }
}

String canDurumu(int can) {
  switch (can) {
    case 0:
      return _svg_yqb6y3;
    case 1:
      return _svg_yqb6y4;
    default:
      return _svg_yqb6y3;
  }
}

class _GorevVarPageState extends State<GorevVarPage> {
  double right = 8;
  bool can = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Container(
      height: boy,
      width: en,
      child: Column(
        children: [
          AppBarTwo(
            gorevsayisi: widget.gorevler.length,
            gorevler: widget.gorevler,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: widget.gorevler.map((gorev) {
                return Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: en * 0.03),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff000000)
                                                .withOpacity(0.05),
                                            offset: Offset(0, 4),
                                            blurRadius: 9)
                                      ]),
                                  margin: EdgeInsets.all(8),
                                  width: en * 0.9,
                                  height: boy * 0.08,
                                  child: Row(children: [
                                    IconButton(
                                        color: durumRengi(gorev.durum),
                                        icon: getHangiDurum(gorev.durum),
                                        onPressed: () {
                                          setState(() {
                                            gorev.durum =
                                                gorev.durum == 0 ? 1 : 0;
                                          });
                                          widget.db.rawUpdate(
                                              "UPDATE gorevler SET durum = ${gorev.durum} WHERE id = ${gorev.id}");
                                          widget.getGorevler();
                                        }),
                                    Text(
                                      gorev.date == null ? "" : gorev.date,
                                    ),
                                    SizedBox(
                                      width: en * 0.03,
                                    ),
                                    Text(
                                      gorev.title == null ? "" : gorev.title,
                                      style: TextStyle(
                                          decoration: gorev.durum == 0
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          fontSize: boy * 0.022,
                                          fontFamily: 'Rubik-Medium',
                                          fontWeight: FontWeight.bold,
                                          color: gorev.durum == 0
                                              ? Color(0xffC3C1C1)
                                              : Color(0xff554E8F)),
                                    ),
                                  ])),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffFFCFCF),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                margin: EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: IconButton(
                                    color: Colors.red,
                                    iconSize: 25,
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      widget.db.rawDelete(
                                          "DELETE FROM gorevler WHERE id = ${gorev.id}");

                                      print("silindi");
                                      widget.getGorevler();
                                    }),
                              )
                            ],
                          ),
                          Positioned(
                            left: en * 0.85,
                            top: boy * 0.045,
                            child: GestureDetector(
                              onTap: () {
                                gorev.can = gorev.can == 0 ? 1 : 0;
                                widget.db.rawUpdate(
                                    "UPDATE gorevler SET can = ${gorev.can} WHERE id = ${gorev.id}");
                                widget.getGorevler();
                              },
                              child: SvgPicture.string(
                                canDurumu(gorev.can),
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                          ),
                          Positioned(
                            top: boy * 0.013,
                            left: en * 0.035,
                            child: Container(
                              color: getHangiColor(gorev.kategori),
                              height: boy * 0.08,
                              width: en * 0.02,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: boy * 0.01,
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_yqb6y3 =
    '<svg viewBox="0.0 0.0 10.9 14.1" ><path transform="translate(-171.41, -392.11)" d="M 175.207275390625 404.5139770507813 C 175.2072296142578 404.5176391601563 175.2069854736328 404.5213012695313 175.2069854736328 404.5249633789063 C 175.2069854736328 405.4469604492188 175.9543762207031 406.1943359375 176.8763427734375 406.1943359375 C 177.7983093261719 406.1943359375 178.5457153320313 405.4469604492188 178.5457153320313 404.5249633789063 C 178.5457153320313 404.5213012695313 178.5454711914063 404.5176391601563 178.5454254150391 404.5139770507813 L 175.207275390625 404.5139770507813 Z" fill="#d9d9d9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-51.49, 0.0)" d="M 62.28471755981445 10.31263160705566 L 60.78229141235352 8.105597496032715 C 60.78229141235352 7.429987907409668 60.78229141235352 5.779140949249268 60.78229141235352 5.352091789245605 C 60.78229141235352 3.495138883590698 59.4598274230957 1.947254061698914 57.70537567138672 1.598429918289185 L 57.70537567138672 0.7505240440368652 C 57.70534515380859 0.3360422551631927 57.36933135986328 0 56.9548225402832 0 C 56.54030990600586 0 56.20429611206055 0.3360422551631927 56.20429611206055 0.7505240440368652 L 56.20429611206055 1.598461508750916 C 54.44984436035156 1.947316288948059 53.12737655639648 3.495201349258423 53.12737655639648 5.352122783660889 C 53.12737655639648 6.079075813293457 53.12737655639648 7.684280395507813 53.12737655639648 8.105628967285156 L 51.62495040893555 10.31266403198242 C 51.46669387817383 10.54513263702393 51.44995498657227 10.84604644775391 51.58145523071289 11.09463596343994 C 51.71295547485352 11.34322834014893 51.97110748291016 11.49869728088379 52.25234222412109 11.49869728088379 L 61.65729522705078 11.49869728088379 C 61.93852996826172 11.49869728088379 62.19668960571289 11.3431978225708 62.32818603515625 11.09463596343994 C 62.459716796875 10.84601402282715 62.44295120239258 10.54510021209717 62.28471755981445 10.31263160705566 Z" fill="#d9d9d9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yqb6y4 =
    '<svg viewBox="0.0 0.0 10.9 14.1" ><path transform="translate(-171.41, -392.11)" d="M 175.207275390625 404.5139770507813 C 175.2072296142578 404.5176391601563 175.2069854736328 404.5213012695313 175.2069854736328 404.5249633789063 C 175.2069854736328 405.4469604492188 175.9543762207031 406.1943359375 176.8763427734375 406.1943359375 C 177.7983093261719 406.1943359375 178.5457153320313 405.4469604492188 178.5457153320313 404.5249633789063 C 178.5457153320313 404.5213012695313 178.5454711914063 404.5176391601563 178.5454254150391 404.5139770507813 L 175.207275390625 404.5139770507813 Z" fill="#d9d9d9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-51.49, 0.0)" d="M 62.28471755981445 10.31263160705566 L 60.78229141235352 8.105597496032715 C 60.78229141235352 7.429987907409668 60.78229141235352 5.779140949249268 60.78229141235352 5.352091789245605 C 60.78229141235352 3.495138883590698 59.4598274230957 1.947254061698914 57.70537567138672 1.598429918289185 L 57.70537567138672 0.7505240440368652 C 57.70534515380859 0.3360422551631927 57.36933135986328 0 56.9548225402832 0 C 56.54030990600586 0 56.20429611206055 0.3360422551631927 56.20429611206055 0.7505240440368652 L 56.20429611206055 1.598461508750916 C 54.44984436035156 1.947316288948059 53.12737655639648 3.495201349258423 53.12737655639648 5.352122783660889 C 53.12737655639648 6.079075813293457 53.12737655639648 7.684280395507813 53.12737655639648 8.105628967285156 L 51.62495040893555 10.31266403198242 C 51.46669387817383 10.54513263702393 51.44995498657227 10.84604644775391 51.58145523071289 11.09463596343994 C 51.71295547485352 11.34322834014893 51.97110748291016 11.49869728088379 52.25234222412109 11.49869728088379 L 61.65729522705078 11.49869728088379 C 61.93852996826172 11.49869728088379 62.19668960571289 11.3431978225708 62.32818603515625 11.09463596343994 C 62.459716796875 10.84601402282715 62.44295120239258 10.54510021209717 62.28471755981445 10.31263160705566 Z" fill="#FFDC00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
