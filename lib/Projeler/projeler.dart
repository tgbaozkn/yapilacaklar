import 'package:flutter/material.dart';
import '../Anasayfa/ui/altmenubar.dart';
import './ui/appbar2.dart';
import '../Anasayfa/anasayfaPage.dart';
import 'ui/projeolustur.dart';
import 'ui/icons/alisveris.dart';
import 'ui/icons/Kisisel.dart';
import 'ui/icons/Is.dart';
import 'ui/icons/Bulusma.dart';
import 'ui/icons/Ders.dart';
import 'ui/icons/Parti.dart';

class Projeler extends StatefulWidget {
  @override
  _ProjelerState createState() => _ProjelerState();
}

class _ProjelerState extends State<Projeler> {
  double gorevyazMargin = 1;
  double opacity = 0;
  bool gorunur = false;
  @override
  Widget build(BuildContext context) {
    final double boy = MediaQuery.of(context).size.height;
    final double en = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBarTwo(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "   Projeler",
                        style: TextStyle(
                          fontSize: boy * 0.025,
                          fontFamily: 'Rubik-Medium',
                          color: Color(0xff8B87B3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: en * 0.4,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gorevyazMargin = 0.14;
                            opacity = 0.5;
                          });
                        },
                        child: Container(
                          width: en * 0.36,
                          height: boy * 0.032,
                          child: Center(
                              child: Text(
                            "Yeni Proje",
                            style: TextStyle(
                              fontFamily: 'Rubik-Medium',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                            ),
                          )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFF857C3),
                                Color(0xFFE0139C),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 9,
                                  offset: Offset(0, 7),
                                  color: Color(0xFFF456C3).withOpacity(0.47)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                liste(context),
                SizedBox(
                  height: boy * 0.1,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: boy * 0.885),
          height: boy * 0.125,
          child: AltMenuBar(
            aktif1: gorunur ? true : false,
            aktif2: gorunur ? false : true,
            git: () {
              setState(() {
                print("girise basildi");
                gorunur = true;
              });
            },
            sayfaGecis: () {
              setState(() {
                gorunur = false;
                print("a");
              });
            },
            gorevekle: () {
              setState(() {
                gorevyazMargin = 0.14;
                opacity = 0.5;
              });
            },
          ),
        ),
        if (gorevyazMargin == 0.14)
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.black.withOpacity(opacity),
            width: double.infinity,
            height: double.infinity,
          )
        else
          Container(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * gorevyazMargin),
          child: YeniProje(
            onTap: () {
              setState(
                () {
                  gorevyazMargin = 1;
                  opacity = 0;
                },
              );
            },
            olustur: () {
              setState(() {});
            },
          ),
        ),
        if (gorunur)
          AnimatedContainer(
            height: double.infinity,
            width: double.infinity,
            duration: Duration(milliseconds: 400),
            child: Projeler(),
          )
        else
          Container(),
        if (gorunur)
          AnimatedContainer(
              duration: Duration(milliseconds: 400), child: Yapilacaklar())
        else
          Container(),
      ],
    );
  }
}

Widget liste(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            container(context,
                widget: Kisisel(), task: "task", text: "Kişisel"),
            container(context, widget: Is(), task: "task", text: "İş"),
          ],
        ),
        Row(
          children: [
            container(context,
                widget: Bulusma(), task: "task", text: "Buluşma"),
            container(context,
                widget: alisveris(), task: "task", text: "Alışveriş"),
          ],
        ),
        Row(
          children: [
            container(context, widget: parti(), task: "task", text: "Parti"),
            container(context, widget: ders(), task: "task", text: "Ders"),
          ],
        ),
      ],
    ),
  );
}

Widget container(BuildContext context,
    {Widget widget, String text, String task}) {
  final double boy = MediaQuery.of(context).size.height;
  final double en = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.fromLTRB(18, 0, 0, 24),
    child: Stack(
      children: [
        Container(
          height: boy * 0.25,
          width: en * 0.42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(0, 5),
                color: Color(0xffBBBBBB).withOpacity(0.35),
              ),
            ],
          ),
        ),
        Positioned(
          left: en * 0.14,
          top: boy * 0.06,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget,
              Padding(
                padding: EdgeInsets.only(top: 6.8),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: boy * 0.024,
                      color: Color(0xff686868),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik-Medium'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: boy * 0.012),
                child: Text(
                  task,
                  style: TextStyle(
                      fontSize: boy * 0.012,
                      color: Color(0xffA1A1A1),
                      fontFamily: 'Rubik-Regular'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

const String _svg_i8kqcq =
    '<svg viewBox="53.6 8.5 52.3 49.2" ><path transform="translate(-42.45, -57.13)" d="M 123.1631469726563 65.61399841308594 L 121.2984771728516 65.61399841308594 C 110.8623275756836 65.61399841308594 102.3720016479492 74.10433197021484 102.3720016479492 84.54047393798828 L 102.3720016479492 102.0985641479492 C 102.3720016479492 103.2075347900391 103.2710571289063 104.1065979003906 104.3800048828125 104.1065979003906 L 140.0814971923828 104.1065979003906 C 141.1904602050781 104.1065979003906 142.0895080566406 103.2075347900391 142.0895080566406 102.0985641479492 L 142.0895080566406 84.54047393798828 C 142.0896301269531 74.10433197021484 133.5991821289063 65.61399841308594 123.1631469726563 65.61399841308594 Z" fill="#feeb70" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, -289.36)" d="M 98.84806060791016 347.0675659179688 L 60.71004867553711 347.0675659179688 C 56.79948806762695 347.0675659179688 53.61799621582031 343.885986328125 53.61799621582031 339.9753112792969 L 53.61799621582031 339.4148559570313 C 53.61799621582031 335.5043334960938 56.79948806762695 332.322998046875 60.71004867553711 332.322998046875 L 98.84820556640625 332.322998046875 C 102.7588882446289 332.322998046875 105.9403839111328 335.5044860839844 105.9403839111328 339.4148559570313 L 105.9403839111328 339.9753112792969 C 105.9401245117188 343.885986328125 102.7586288452148 347.0675659179688 98.84806060791016 347.0675659179688 Z" fill="#fef7cb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
