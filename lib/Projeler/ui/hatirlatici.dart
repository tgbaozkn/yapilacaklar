import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import '../../Anasayfa/ui/Gorev.dart';

class Hatirlatici extends StatelessWidget {
  Hatirlatici({this.gorevler});
  List<Gorev> gorevler = [];
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 49.0),
            child: Container(
              width: en * 0.9,
              height: boy * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0x4fffffff),
              ),
            ),
          ),
        ),
        Transform(
          transform: Matrix4(0.927184, 0.374607, 0.0, 0.0, -0.374607, 0.927184,
              0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 259.43, -3.1, 0.0, 1.0),
          child:
              // Adobe XD layer: 'bell (1)' (group)
              Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(41.97, 0.0),
                child: Stack(
                  children: <Widget>[
                    SvgPicture.string(
                      _svg_x28iex,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(23.62, 8.48),
                child: SvgPicture.string(
                  _svg_i8kqcq,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(16.0, 21.0),
          child: Text(
            'Hatırlatıcı',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 20,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(16.0, 49.0),
          child: Text(
            //"Müşteri İle Buluşma",
            gorevler.length == 0 ? "Proje Yok " : gorevler[0].title,
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 11,
              color: const Color(0xfff3f3f3),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(16.0, 68.0),
          child: Text(
            gorevler.length == 0 ? "Saat Belirtilmedi" : gorevler[0].date,
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 11,
              color: const Color(0xfff3f3f3),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

const String _svg_x28iex =
    '<svg viewBox="0.0 0.0 15.6 66.2" ><path transform="translate(-195.57, -304.5)" d="M 203.3815460205078 370.6834411621094 C 199.0742340087891 370.6834411621094 195.5699920654297 367.1790466308594 195.5699920654297 362.8717956542969 L 195.5699920654297 355.5945739746094 C 195.5699920654297 352.3462829589844 198.2124328613281 349.7039489746094 201.4604949951172 349.7039489746094 L 205.3022918701172 349.7039489746094 C 208.5504913330078 349.7039489746094 211.1928558349609 352.346435546875 211.1928558349609 355.5945739746094 L 211.1928558349609 362.8717956542969 C 211.1930847167969 367.1792297363281 207.6887817382813 370.6834411621094 203.3815460205078 370.6834411621094 Z" fill="#ff52a8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-207.07, 0.0)" d="M 215.0943450927734 20.97949600219727 L 214.66650390625 20.97949600219727 C 211.4182891845703 20.97949600219727 208.7759704589844 18.33703804016113 208.7759704589844 15.08896923065186 L 208.7759704589844 6.104589462280273 C 208.7759704589844 2.73850154876709 211.5144500732422 0 214.8804626464844 0 C 218.246337890625 0 220.9850158691406 2.73850154876709 220.9850158691406 6.104589462280273 L 220.9850158691406 15.08896923065186 C 220.9850158691406 18.3369083404541 218.3423461914063 20.97949600219727 215.0943450927734 20.97949600219727 Z" fill="#ff52a8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i8kqcq =
    '<svg viewBox="53.6 8.5 52.3 49.2" ><path transform="translate(-42.45, -57.13)" d="M 123.1631469726563 65.61399841308594 L 121.2984771728516 65.61399841308594 C 110.8623275756836 65.61399841308594 102.3720016479492 74.10433197021484 102.3720016479492 84.54047393798828 L 102.3720016479492 102.0985641479492 C 102.3720016479492 103.2075347900391 103.2710571289063 104.1065979003906 104.3800048828125 104.1065979003906 L 140.0814971923828 104.1065979003906 C 141.1904602050781 104.1065979003906 142.0895080566406 103.2075347900391 142.0895080566406 102.0985641479492 L 142.0895080566406 84.54047393798828 C 142.0896301269531 74.10433197021484 133.5991821289063 65.61399841308594 123.1631469726563 65.61399841308594 Z" fill="#feeb70" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, -289.36)" d="M 98.84806060791016 347.0675659179688 L 60.71004867553711 347.0675659179688 C 56.79948806762695 347.0675659179688 53.61799621582031 343.885986328125 53.61799621582031 339.9753112792969 L 53.61799621582031 339.4148559570313 C 53.61799621582031 335.5043334960938 56.79948806762695 332.322998046875 60.71004867553711 332.322998046875 L 98.84820556640625 332.322998046875 C 102.7588882446289 332.322998046875 105.9403839111328 335.5044860839844 105.9403839111328 339.4148559570313 L 105.9403839111328 339.9753112792969 C 105.9401245117188 343.885986328125 102.7586288452148 347.0675659179688 98.84806060791016 347.0675659179688 Z" fill="#fef7cb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
