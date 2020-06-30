import 'package:flutter/material.dart';
import './icon_onboarding.dart';
import './text_onboarding.dart';
import 'baslayalimbutton.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
        ),
        icon_onboarding(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        text_onboarding(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        Baslayalim(),
      ],
    );
  }
}
