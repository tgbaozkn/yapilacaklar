import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  Photo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
         boxShadow: [
          BoxShadow(
            color: const Color(0x29242424),
            offset: Offset(0, 3),
            blurRadius: 18,
          ),],
        borderRadius:
            BorderRadius.all(Radius.elliptical(20.0, 20.0)),
        
        border:
            Border.all(width: 0.40, color: const Color(0xff707070)),
      image: DecorationImage(
      image:  AssetImage('assets/images/girl.png'),
      fit: BoxFit.fill,
    ),
        ),
      );
  }
}
