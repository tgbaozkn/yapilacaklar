import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Secenekler_buton.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:convert' show utf8;

class YeniGorevModal extends StatefulWidget {
  Function closeFunc, saveFunc; //kapatma fonksiyonu
  Database db; //database e kaydetmek icin
  Function getGorevler;
  YeniGorevModal({this.closeFunc, this.db, this.saveFunc, this.getGorevler});

  @override
  _YeniGorevModalState createState() => _YeniGorevModalState();
}

//burası yandaki sayfa yeni görev ekle sayfası
class _YeniGorevModalState extends State<YeniGorevModal> {
  String isim = "";
  DateTime secilenTarih = DateTime.now();
  String secilen = "";

  String _time = DateFormat("HH:mm").format(DateTime.now());
  void submitForm() {
    print(isim);
    print(secilenTarih);
  }

  @override
  Widget build(BuildContext context) {
    final double boy = MediaQuery.of(context).size.height;
    final double en = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Stack(
        children: [
          //arka fon
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: boy * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(300, 60.5),
                  topRight: Radius.elliptical(300, 60.5)),
            ),
          ),
          //kapatma dugmesi
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: en * 0.45),
            width: boy * 0.065,
            height: boy * 0.065,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(26.5, 26.5)),
              gradient: LinearGradient(
                colors: [const Color(0xfff857c3), const Color(0xffe0139c)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x78f456c3),
                  offset: Offset(0, 7),
                  blurRadius: 9,
                ),
              ],
            ),
          ),
          //kapatma dugmesinin "x" sembolu
          Container(
            margin: EdgeInsets.only(left: 5),
            alignment: Alignment.center,
            height: boy * 0.05,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => widget.closeFunc(),
              color: Colors.white,
            ),
          ),
          Column(
            //yeni gorev ekle baslıgı ,text field ve görev konusu
            children: [
              SizedBox(
                height: boy * 0.08,
              ),
              Center(
                child: Text(
                  "Yeni görev ekle",
                  style: TextStyle(
                      color: Color(0xff404040),
                      fontSize: boy * 0.022,
                      fontFamily: 'Rubik-Medium',
                      fontWeight: FontWeight.w600),
                ),
              ),
              //text field -gorevin girlecegi kısım
              Container(
                margin: EdgeInsets.only(left: en * 0.05, top: en * 0.1),
                width: en * 0.88,
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff373737),
                    fontSize: 20,
                    fontFamily: 'Rubik-Regular',
                  ),
                  onChanged: (value) {
                    isim = value;
                  },
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SeceneklerButon(
                        basildi: secilen == "kisisel",
                        arkaplan: Color(0xffFFD506),
                        color: secilen == "kisisel"
                            ? Colors.white
                            : Color(0xffFFD506),
                        text: " Kişisel",
                        func: () {
                          setState(() {
                            secilen = "kisisel";
                          });
                        }),
                    SeceneklerButon(
                        arkaplan: Color(0xff5DE61A),
                        basildi: secilen == "work",
                        color: secilen == "work"
                            ? Colors.white
                            : Color(0xff5DE61A),
                        text: " İş",
                        func: () {
                          setState(() {
                            secilen = "work";
                          });
                        }),
                    SeceneklerButon(
                        arkaplan: Color(0xffD10263),
                        basildi: secilen == "meet",
                        color: secilen == "meet"
                            ? Colors.white
                            : Color(0xffD10263),
                        text: " Buluşma",
                        func: () {
                          setState(() {
                            secilen = "meet";
                          });
                        }),
                    SeceneklerButon(
                        arkaplan: Color(0xff3044F2),
                        basildi: secilen == "ders",
                        color: secilen == "ders"
                            ? Colors.white
                            : Color(0xff3044F2),
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
                        color: secilen == "shopping"
                            ? Colors.white
                            : Color(0xffF29130),
                        func: () {
                          setState(() {
                            secilen = "shopping";
                          });
                        }),
                    SeceneklerButon(
                        basildi: secilen == "party",
                        text: " Parti",
                        arkaplan: Color(0xff09ACCE),
                        color: secilen == "party"
                            ? Colors.white
                            : Color(0xff09ACCE),
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
              ), //kisiel is bulusma yazan kısım gorev kriterleri
              Divider(
                //alt cizgi
                // bu alttakş çizgi
                indent: en * 0.09,
                endIndent: en * 0.03,
                thickness: 0.6,
                color: Colors.black,
              ),
              FlatButton(
                //tarih ve saat seçimi
                onPressed: () async {
                  secilenTarih = await DatePicker.showDatePicker(
                    context,
                    minTime: DateTime.now().add(Duration(seconds: 1)),
                    currentTime: DateTime.now(),
                    maxTime: DateTime(2100),
                    locale: LocaleType.tr,
                  );
                  DatePicker.showTimePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true, onConfirm: (time) {
                    _time = '${time.hour} : ${time.minute} ';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.tr);
                  setState(() {});
                },
                child: Row(
                  //tarih seç başlığı
                  children: [
                    SizedBox(
                      width: en * 0.05,
                      height: boy * 0.15,
                    ),
                    Text("Tarih Seç            "),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(en * 0.1, 0, en * 0.65, 0),
                child: Row(
                  children: [
                    Text(DateTime.now().day == secilenTarih.day
                        ? DateFormat('Bugün,').format(secilenTarih)
                        : DateTime.now().add(Duration(days: 1)).day ==
                                secilenTarih.day
                            ? DateFormat("Yarın,").format(secilenTarih)
                            : DateFormat('EEE,').format(secilenTarih)),
                    Text("$_time"),
                  ],
                ),
              ),
              SizedBox(height: boy * 0.098),
              olustur(
                  context: context,
                  onTap: () {
                    widget.db.rawInsert(
                        "INSERT INTO gorevler(name,date,kategori) VALUES('$isim','$_time','$secilen');"); //idsini otomatik belirle ve gorevlerin içine giirlen ismi name olarak ata.
                    widget.getGorevler(); //girilen gorevin buradan okunması
                    widget
                        .closeFunc(); //gorev girildikten sonra kapanıyor yenigorevekle modalı
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

Widget olustur({BuildContext context, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Center(
          child: Text(
        "Oluştur",
        style: TextStyle(
          fontFamily: 'Rubik-Medium',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height * 0.032,
        ),
      )),
      width: MediaQuery.of(context).size.width * 0.86,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Color(0xFF7EB6FF),
            Color(0xFF5F87E7),
          ],
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 6, offset: Offset(0, 3), color: Color(0xFF6894EE)),
        ],
      ),
    ),
  );
}
