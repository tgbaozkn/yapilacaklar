import 'package:flutter/material.dart';
import '../../Anasayfa/anasayfaPage.dart';

class Baslayalim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute<void>(builder: (context) => Yapilacaklar()));
        print("object");
      },
      child: Container(
        child: Center(
            child: Text(
          "Başlayalım",
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.03,
          ),
        )),
        width: MediaQuery.of(context).size.width * 0.68,
        height: MediaQuery.of(context).size.height * 0.1,
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
                blurRadius: 30, offset: Offset(0, 5), color: Color(0xFF66C81C)),
          ],
        ),
      ),
    );
  }
}
