import 'package:flutter/material.dart';
import 'package:yapilacaklar/Anasayfa/ui/Secenekler_buton.dart';
import 'Secenekler_buton.dart';

class Secenekler extends StatefulWidget {
  @override
  _SeceneklerState createState() => _SeceneklerState();
}

class _SeceneklerState extends State<Secenekler> {
  bool kisisel = false;
  bool work = false;
  bool meet = false;
  bool ders = false;
  bool shopping = false;
  bool party = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SeceneklerButon(
              basildi: kisisel,
              arkaplan: Color(0xffFFD506),
              color: kisisel ? Colors.white : Color(0xffFFD506),
              text: " Kişisel",
              func: () {
                setState(() {
                  kisisel = !kisisel;
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xff5DE61A),
              basildi: work,
              color: work ? Colors.white : Color(0xff5DE61A),
              text: " İş",
              func: () {
                setState(() {
                  work = !work;
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xffD10263),
              basildi: meet,
              color: meet ? Colors.white : Color(0xffD10263),
              text: " Buluşma",
              func: () {
                setState(() {
                  meet = !meet;
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xff3044F2),
              basildi: ders,
              color: ders ? Colors.white : Color(0xff3044F2),
              text: " Ders",
              func: () {
                setState(() {
                  ders = !ders;
                });
              }),
          SeceneklerButon(
              arkaplan: Color(0xffF29130),
              basildi: shopping,
              text: " Alışveriş",
              color: shopping ? Colors.white : Color(0xffF29130),
              func: () {
                setState(() {
                  shopping = !shopping;
                });
              }),
          SeceneklerButon(
              basildi: party,
              text: " Parti",
              arkaplan: Color(0xff09ACCE),
              color: party ? Colors.white : Color(0xff09ACCE),
              func: () {
                setState(() {
                  party = !party;
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
