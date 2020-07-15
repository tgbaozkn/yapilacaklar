import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Is extends StatelessWidget {
  Function onTap;
  Is({Key key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            width: 65.1,
            height: 65.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(32.56, 32.56)),
              color: const Color(0x5cb5ff9b),
            ),
          ),
          Transform.translate(
            offset: Offset(18.0, 19.5),
            child:
                // Adobe XD layer: 'briefcase' (group)
                Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, 0.5),
                  child: SvgPicture.string(
                    _svg_45c96q,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_45c96q =
    '<svg viewBox="0.0 0.5 28.6 25.9" ><path transform="translate(0.0, -204.66)" d="M 25.55800437927246 220.1645965576172 C 24.89528274536133 220.7758178710938 24.03392601013184 221.1126098632813 23.13239288330078 221.1126098632813 L 17.33116149902344 221.1126098632813 L 17.33116149902344 221.9379577636719 C 17.33116149902344 223.3031311035156 16.22051811218262 224.4140014648438 14.8553466796875 224.4140014648438 L 13.75474262237549 224.4140014648438 C 12.38957405090332 224.4140014648438 11.27892875671387 223.3031311035156 11.27892875671387 221.9379577636719 L 11.27892875671387 221.1126098632813 L 6.375542163848877 221.1126098632813 C 5.633144378662109 221.1126098632813 4.92000150680542 220.8862609863281 4.313384532928467 220.4582061767578 L -0.0006256103515625 217.4015197753906 L -0.0006256103515625 224.9640808105469 L 2.200145721435547 224.9640808105469 C 4.475574970245361 224.9640808105469 6.326869010925293 226.8153686523438 6.326869010925293 229.0907897949219 L 6.326869010925293 231.0165405273438 L 22.28322792053223 231.0165405273438 L 22.28322792053223 229.0907897949219 C 22.28322792053223 226.8153686523438 24.134521484375 224.9640808105469 26.40995216369629 224.9640808105469 L 28.6107234954834 224.9640808105469 L 28.6107234954834 217.2697143554688 L 25.5660514831543 220.1567840576172 C 25.56343078613281 220.1593780517578 25.56059265136719 220.1620025634766 25.55797386169434 220.1646270751953 Z M 25.55800437927246 220.1645965576172" fill="#1ed102" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-218.45, -213.81)" d="M 233.3091430664063 231.9129638671875 C 233.7640380859375 231.9129638671875 234.1344909667969 231.542724609375 234.1344909667969 231.0876159667969 L 234.1344909667969 227.7862243652344 C 234.1344909667969 227.3311157226563 233.7640380859375 226.9609069824219 233.3091430664063 226.9609069824219 L 232.2085266113281 226.9609069824219 C 231.7536010742188 226.9609069824219 231.3831787109375 227.3311157226563 231.3831787109375 227.7862243652344 L 231.3831787109375 231.0876159667969 C 231.3831787109375 231.542724609375 231.7536010742188 231.9129638671875 232.2085266113281 231.9129638671875 L 233.3091430664063 231.9129638671875 Z M 233.3091430664063 231.9129638671875" fill="#1ed102" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, 0.0)" d="M 26.13490104675293 7.102138996124268 L 22.14111518859863 7.102138996124268 L 20.8353214263916 2.140249729156494 C 20.58123397827148 1.174326181411743 19.70590400695801 0.4996013641357422 18.70702171325684 0.4996013641357422 L 9.903502464294434 0.4996013641357422 C 8.904619216918945 0.4996013641357422 8.02928638458252 1.174326181411743 7.77520227432251 2.140249729156494 L 6.469407081604004 7.102138996124268 L 2.475620746612549 7.102138996124268 C 1.110233664512634 7.102138996124268 -0.0004119873046875 8.21300220489502 -0.0004119873046875 9.578171730041504 L -0.0004119873046875 10.72200012207031 L 5.266858577728271 14.45384216308594 C 5.592106342315674 14.68347835540771 5.976073741912842 14.80528354644775 6.375978946685791 14.80528354644775 L 11.27914905548096 14.80528354644775 L 11.27914905548096 13.97994136810303 C 11.27914905548096 12.61477184295654 12.38979339599609 11.50390911102295 13.75496387481689 11.50390911102295 L 14.85556697845459 11.50390911102295 C 16.22073364257813 11.50390911102295 17.33138084411621 12.61477184295654 17.33138084411621 13.97994136810303 L 17.33138084411621 14.80528354644775 L 23.13260841369629 14.80528354644775 C 23.6163330078125 14.80528354644775 24.07866668701172 14.62541484832764 24.43490982055664 14.29820251464844 L 28.59328269958496 10.35484313964844 C 28.59895896911621 10.3496036529541 28.60507202148438 10.34502029418945 28.61096382141113 10.33978176116943 L 28.61096382141113 9.578176498413086 C 28.61096382141113 8.213006973266602 27.50031852722168 7.102144718170166 26.13493156433105 7.102144718170166 Z M 11.02090549468994 7.102138996124268 L 11.60002136230469 4.9013671875 L 17.0102710723877 4.9013671875 L 17.5896053314209 7.102138996124268 L 11.02090549468994 7.102138996124268 Z M 11.02090549468994 7.102138996124268" fill="#1ed102" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-404.37, -362.54)" d="M 428.3089904785156 386.9764404296875 L 428.3089904785156 388.9021911621094 L 430.509765625 388.9021911621094 C 431.8751220703125 388.9021911621094 432.9857788085938 387.7915344238281 432.9857788085938 386.4261474609375 L 432.9857788085938 384.5003967285156 L 430.7850341796875 384.5003967285156 C 429.4196472167969 384.5003967285156 428.3089904785156 385.6110534667969 428.3089904785156 386.9764404296875 Z M 428.3089904785156 386.9764404296875" fill="#1ed102" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, -362.54)" d="M 2.200771331787109 384.5 L 0 384.5 L 0 386.4257202148438 C 0 387.7911376953125 1.110645532608032 388.9017639160156 2.476032495498657 388.9017639160156 L 4.676805019378662 388.9017639160156 L 4.676805019378662 386.9760437011719 C 4.676805019378662 385.6106567382813 3.566158771514893 384.5 2.200771570205688 384.5 Z M 2.200771331787109 384.5" fill="#1ed102" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
