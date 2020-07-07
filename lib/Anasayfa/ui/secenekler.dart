import 'package:flutter/material.dart';

class Secenekler extends StatefulWidget {
  @override
  _SeceneklerState createState() => _SeceneklerState();
}

//eger secildiyse kendi rengi arkapln olsun
void isSelected() {}

class _SeceneklerState extends State<Secenekler> {
  @override
  Widget build(BuildContext context) {
    bool basildi = false;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buton(
                color: basildi ? Colors.black : Color(0xffFFD506),
                text: " Kişisel",
                key: " Kişisel",
                func: () {
                  setState(() {
                    basildi = !basildi;
                    print("aa");
                  });
                }),
            buton(color: Color(0xff5DE61A), text: " İş", key: "İş"),
            buton(color: Color(0xffD10263), text: " Buluşma", key: "Buluşma"),
            buton(color: Color(0xff3044F2), text: " Ders", key: "Ders"),
            buton(text: " Alışveriş", color: Color(0xffF29130))
          ],
        ));
  }
}

//,Text("Alışveriş"),
Widget buton({String text, Color color, String key, Function func}) {
  return GestureDetector(
    key: Key(key),
    onTap: func,
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 22, 0, 17),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: new BoxDecoration(
              shape: BoxShape
                  .circle, // You can use like this way or like the below line
              //borderRadius: new BorderRadius.circular(30.0),
              color: color,
            ),
          ),
          InkWell(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Rubik-Regular',
                fontSize: 16,
                color: Color(0xff8E8E8E),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
