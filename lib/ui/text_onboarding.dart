import 'package:flutter/material.dart';

class text_onboarding extends StatelessWidget {
  text_onboarding({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: <Widget>[
        Text(
          'Yapacaklarını asla unutmazsın',textDirection: TextDirection.ltr,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: MediaQuery.of(context).size.height*0.034,
            color: Color(0xff554e8f),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 11,),
        Text(
          'Bu uygulama sayesinde yapacağın \n işleri ve projelerini kolaylıkla takip \n edebilir ve hayatını organize\n edebilirsin.',
          style: TextStyle(
        fontFamily: 'Open Sans',
        fontSize: MediaQuery.of(context).size.height*0.028,
        color:  Color(0xff82a0b7),
        height: 1.411764705882353,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
