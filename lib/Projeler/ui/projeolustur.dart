import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'icons/alisveris.dart';
import 'icons/Parti.dart';
import 'icons/Ders.dart';
import 'icons/Kisisel.dart';
import 'icons/Is.dart';
import 'icons/Bulusma.dart';

class YeniProje extends StatefulWidget {
  Function onTap;
  Function olustur;
  YeniProje({this.onTap, this.olustur});

  @override
  _YeniProjeState createState() => _YeniProjeState();
}

class _YeniProjeState extends State<YeniProje> {
  TextEditingController controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('EEE,HH:mm');
  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting('tr', null);
    final double boy = MediaQuery.of(context).size.height;
    final double en = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        children: [
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
          Container(
            margin: EdgeInsets.only(left: 5),
            height: boy * 0.06,
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => widget.onTap(),
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: boy * 0.08,
              ),
              Center(
                child: Text(
                  "Yeni proje oluştur",
                  style: TextStyle(
                      color: Color(0xff404040),
                      fontSize: boy * 0.022,
                      fontFamily: 'Rubik-Medium',
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: en * 0.05, top: en * 0.1),
                width: en * 0.88,
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff373737),
                    fontSize: 20,
                    fontFamily: 'Rubik-Regular',
                  ),
                  onSubmitted: (value) {},
                  controller: controller,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              //ikonlar
              SizedBox(
                height: boy * 0.06,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, bottom: 11),
                child: Text(
                  "İkon seç",
                  style: TextStyle(fontSize: boy * 0.018),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Transform.scale(scale: 0.8, child: ikonlar(context))
                  ],
                ),
              ),
              //Text(Jiffy(selectedDate).format('EEE,HH:dd')) //Mon,18:22,
              SizedBox(height: boy * 0.098),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: olustur(context, () {
                  setState(() {
                    print("basıldı");
                    String text = controller.text;
                    print(text);
                  });
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget olustur(BuildContext context, Function func) {
  return GestureDetector(
    onTap: () {
      print("Olusturuldu");
      func();
    },
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

Widget ikonlar(BuildContext context) {
  double en = MediaQuery.of(context).size.width;
  return Row(
    children: [
      SizedBox(
        width: en * 0.0346,
      ),
      alisveris(),
      SizedBox(
        width: en * 0.0346,
      ),
      Bulusma(), //bulusma
      SizedBox(
        width: en * 0.0346,
      ),
      Kisisel(), //kişisel
      SizedBox(
        width: en * 0.0346,
      ),
      Is(),
      SizedBox(
        width: en * 0.0346,
      ),
      parti(), //kişisel
      SizedBox(
        width: en * 0.0346,
      ),
      ders() //iş
    ],
  );
}
