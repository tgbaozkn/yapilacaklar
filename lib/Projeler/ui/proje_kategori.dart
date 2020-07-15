import 'dart:ui';

import 'package:flutter/material.dart';

class ProjeKategori extends StatefulWidget {
  String text;
  Function close;
  ProjeKategori({this.text, this.close});
  @override
  _ProjeKategoriState createState() => _ProjeKategoriState();
}

class _ProjeKategoriState extends State<ProjeKategori> {
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(30),
      height: boy * 0.9,
      width: en * 0.9,
      color: Colors.white.withOpacity(0.7),
      child: Column(
        children: [
          SizedBox(
            height: boy * 0.05,
          ),
          Row(
            children: [
              SizedBox(
                width: en * 0.3,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    fontSize: boy * 0.03,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                width: en * 0.2,
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: widget.close,
              )
            ],
          )
        ],
      ),
    );
  }
}
