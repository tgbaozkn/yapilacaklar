import 'package:flutter/material.dart';

class SeceneklerButon extends StatefulWidget {
  String text;
  Color color, yaziColor, arkaplan;
  Function func;
  bool basildi;
  SeceneklerButon(
      {this.text,
      this.color,
      this.func,
      this.yaziColor,
      this.basildi,
      this.arkaplan});
  @override
  _SeceneklerButonState createState() => _SeceneklerButonState();
}

class _SeceneklerButonState extends State<SeceneklerButon> {
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        widget.basildi
            ? Container(
                margin: EdgeInsets.only(left: en * 0.05, top: 14),
                height: boy * 0.05,
                width: widget.text.length < 7 ? en * 0.15 : en * 0.23,
                color: widget.arkaplan,
              )
            : Container(),
        GestureDetector(
          key: Key(widget.text),
          onTap: () {
            print(widget.text);
            widget.func();
          },
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
                    color: widget.color,
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontFamily: 'Rubik-Regular',
                    fontSize: 16,
                    color: widget.basildi ? Colors.white : Color(0xff8E8E8E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
