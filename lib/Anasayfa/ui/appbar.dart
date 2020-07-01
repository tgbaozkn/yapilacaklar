import 'package:flutter/material.dart';
import 'Photo.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3867D5),
                Color(0xFF81c7f5),
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.13,
        ),
        Positioned(
          top: -105,
          left: -80,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.56,
            height: MediaQuery.of(context).size.height * 0.307,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.17),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.065,
          left: MediaQuery.of(context).size.width * 0.8,
          child: Container(
            width: 93,
            height: 93,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.17),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.037,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.046),
                  child: Text(
                    "Merhaba!",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Rubik-Regular'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.046),
                  child: Text(
                    "Bugün yapılacak hiç görev kalmadı!",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'Rubik-Regular',
                      fontSize: 12,
                      color: Colors.white,
                      //resim
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Photo(),
          ],
        ),
      ],
    );
  }
}
