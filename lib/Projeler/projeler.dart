import 'package:flutter/material.dart';
import 'package:yapilacaklar/anasayfa/ui/altmenubar.dart';
import '../anasayfa/anasayfa.dart';
import './ui/appbar2.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Projeler extends StatefulWidget {
  @override
  _ProjelerState createState() => _ProjelerState();
}

class _ProjelerState extends State<Projeler> {
  @override
  Widget build(BuildContext context) {
    Function _git = () {
      print("calisti");
      Navigator.push(context,
          MaterialPageRoute<void>(builder: (context) => Yapilacaklar()));
    };
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
                AppBarTwo(3),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Projeler"),
                      SizedBox(
                        width: 80,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          "Yeni Proje",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                          ),
                        )),
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF5DE61A),
                              Color(0xFF39A801),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 30,
                                offset: Offset(0, 5),
                                color: Color(0xFF66C81C)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                liste(context)
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: boy * 0.885),
          height: boy * 0.125,
          child: AltMenuBar(() {},
              sayfaGecis: () {},
              //bottomnavigationbar-scaffold
              aktif1: false,
              aktif2: true,
              git: _git),
        ),
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
            container(context, task: "task", text: "text"),
            container(context, task: "task", text: "text"),
          ],
        ),
        Row(
          children: [
            container(context, task: "task", text: "text"),
            container(context, task: "task", text: "text"),
          ],
        ),
        Row(
          children: [
            container(context, task: "task", text: "text"),
            container(context, task: "task", text: "text"),
          ],
        )
      ],
    ),
  );
}

Widget container(BuildContext context,
    {Color colo, String image, String text, String task}) {
  final double boy = MediaQuery.of(context).size.height;
  final double en = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Container(
          height: boy * 0.3,
          width: en * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(0, 5),
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
        ),
        Positioned(
          left: en * 0.15,
          top: boy * 0.1,
          child: Column(
            children: [
              Container(
                width: boy * 0.06,
                height: boy * 0.065,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(Radius.elliptical(26.5, 26.5)),
                ),
                child: SvgPicture.string(
                  _svg_i8kqcq,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              Text(text),
              Text(task),
            ],
          ),
        ),
      ],
    ),
  );
}

const String _svg_i8kqcq =
    '<svg viewBox="53.6 8.5 52.3 49.2" ><path transform="translate(-42.45, -57.13)" d="M 123.1631469726563 65.61399841308594 L 121.2984771728516 65.61399841308594 C 110.8623275756836 65.61399841308594 102.3720016479492 74.10433197021484 102.3720016479492 84.54047393798828 L 102.3720016479492 102.0985641479492 C 102.3720016479492 103.2075347900391 103.2710571289063 104.1065979003906 104.3800048828125 104.1065979003906 L 140.0814971923828 104.1065979003906 C 141.1904602050781 104.1065979003906 142.0895080566406 103.2075347900391 142.0895080566406 102.0985641479492 L 142.0895080566406 84.54047393798828 C 142.0896301269531 74.10433197021484 133.5991821289063 65.61399841308594 123.1631469726563 65.61399841308594 Z" fill="#feeb70" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, -289.36)" d="M 98.84806060791016 347.0675659179688 L 60.71004867553711 347.0675659179688 C 56.79948806762695 347.0675659179688 53.61799621582031 343.885986328125 53.61799621582031 339.9753112792969 L 53.61799621582031 339.4148559570313 C 53.61799621582031 335.5043334960938 56.79948806762695 332.322998046875 60.71004867553711 332.322998046875 L 98.84820556640625 332.322998046875 C 102.7588882446289 332.322998046875 105.9403839111328 335.5044860839844 105.9403839111328 339.4148559570313 L 105.9403839111328 339.9753112792969 C 105.9401245117188 343.885986328125 102.7586288452148 347.0675659179688 98.84806060791016 347.0675659179688 Z" fill="#fef7cb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
