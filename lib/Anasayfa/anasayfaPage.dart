import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Projeler/projeler.dart';
import 'ui/Gorev.dart';
import 'ui/altmenubar.dart';
import 'ui/appbar.dart';
import 'ui/yenigorev.dart';

class Yapilacaklar extends StatefulWidget {
  @override
  _YapilacaklarState createState() => _YapilacaklarState();
}

class _YapilacaklarState extends State<Yapilacaklar> {
  double gorevyazMargin =
      1; //  bu alttan çıkması için animasyon degiskeni top margin ekrandan maksimum uzaklıkta basta gozukmuyor sonra ben + butonuna basınca o margin degeri top : 0.14 oluyor şu an ki hali tekrar kapat butonuna basınca top margin maksimum uzaklıkta
  double opacity = 0;
  bool gorunur = false;
  List<Gorev> gorevler = [];
  List<Widget> listesi = List.generate(7, (index) => Text("liste elemanı"));

  void gorevEkle(String name, String date) {
    final gorev = Gorev(title: name, date: date);
    setState(() {
      gorevler.add(gorev);
    });
  }

  /* void gorevEkle() {
    setState(() {
      int index = _.length;
      //_.add('Gorev' + index.toString());
    });
  }*/

  @override
  void initState() {
    super.initState();
  }

  bool get isWorkMargin => gorevyazMargin == 0.14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildContainerBottomMenu(context),
      body: Stack(
        children: <Widget>[
          buildVisibilityWorkAvaible(context),
          buildVisibilityWorkArea(),
          buildAnimatedContainerAddTask(context),
          buildVisibilityContainer()
        ],
      ),
    );
  }

  Visibility buildVisibilityContainer() {
    return Visibility(
        visible: gorunur,
        child: AnimatedContainer(
          height: double.infinity,
          width: double.infinity,
          duration: Duration(milliseconds: 400),
          child: Projeler(),
        ));
  }

  AnimatedContainer buildAnimatedContainerAddTask(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height *
              gorevyazMargin), //burada childin top marginini setstate de verilen degere gore ayarla
      child: YeniGorev(
        //childe buna gore ayarlanır
        onTap: () {
          setState(
            () {
              gorevyazMargin = 1;
              opacity = 0;
            },
          );
        },
        gorevEkle: gorevEkle,
      ),
    );
  }

  Visibility buildVisibilityWorkArea() {
    return Visibility(
      visible: isWorkMargin,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        color: Colors.black.withOpacity(opacity), //bursı golge
        width: double.infinity,
        height: double.infinity,
      ),
      replacement: Container(),
    );
  }

  Container buildContainerBottomMenu(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.88),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: AltMenuBar(
        //bu artı butonuna bastıgımda top margin 0.14 olsun yakalssin
        gorevekle: () {
          setState(() {
            gorevyazMargin = 0.14;
            opacity = 0.35;
          });
        },
        sayfaGecis: () {
          //projelere gecis
          setState(() {
            gorunur = true;
            //MaterialPageRoute<void>(builder: (context) => Projeler());
          });
        },
        aktif1: gorunur ? false : true,
        aktif2: gorunur ? true : false,
      ),
    );
  }

  Visibility buildVisibilityWorkAvaible(BuildContext context) {
    return Visibility(
      visible: listesi.isNotEmpty,
      child: gorevVar(context, list: gorevler),
      replacement: gorevYok(context),
    );
  }

//gorevyokken gorunum
  Widget gorevYok(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xFFF9FCFF),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                //dört columnn
                //appbar
                Appbar(),

                SizedBox(height: MediaQuery.of(context).size.height * 0.18),

                SvgPicture.string(
                  _svg_z5akyg,
                  allowDrawingOutsideViewBox: true,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                const Text(
                  "Görev Yok",
                  style: TextStyle(
                      fontFamily: 'Rubik-Medium', fontWeight: FontWeight.bold, color: Color(0xFF554E8F), fontSize: 27),
                ),
                //ekran boş simgesi
                SizedBox(height: MediaQuery.of(context).size.height * 0.013),

                Text(
                  "Yapılacak görev kalmadı.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF82A0B7),
                    fontFamily: 'Rubik-Regular',
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                //gorev yok yapilacak gorev kalmadı yazısı
                //ekle butonu ve alttaki giriş projeler kısmı
              ],
            ),
          ),
        ),
      ],
    );
  }

//gorevvarken gorunum
  Widget gorevVar(BuildContext context, {List<Gorev> list}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: <Widget>[
              Center(child: Text("gorev var")),
              ListTile(title: Text(workTitle(list))),
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: list.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(list[index].title),
              //       );
              //     })
            ],
          )
        ],
      ),
    );
  }

  String workTitle(List<Gorev> list) => list.isNotEmpty ? list.first.title : "Name Not Found";
}

const String _svg_yqb6y3 =
    '<svg viewBox="0.0 0.0 10.9 14.1" ><path transform="translate(-171.41, -392.11)" d="M 175.207275390625 404.5139770507813 C 175.2072296142578 404.5176391601563 175.2069854736328 404.5213012695313 175.2069854736328 404.5249633789063 C 175.2069854736328 405.4469604492188 175.9543762207031 406.1943359375 176.8763427734375 406.1943359375 C 177.7983093261719 406.1943359375 178.5457153320313 405.4469604492188 178.5457153320313 404.5249633789063 C 178.5457153320313 404.5213012695313 178.5454711914063 404.5176391601563 178.5454254150391 404.5139770507813 L 175.207275390625 404.5139770507813 Z" fill="#d9d9d9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-51.49, 0.0)" d="M 62.28471755981445 10.31263160705566 L 60.78229141235352 8.105597496032715 C 60.78229141235352 7.429987907409668 60.78229141235352 5.779140949249268 60.78229141235352 5.352091789245605 C 60.78229141235352 3.495138883590698 59.4598274230957 1.947254061698914 57.70537567138672 1.598429918289185 L 57.70537567138672 0.7505240440368652 C 57.70534515380859 0.3360422551631927 57.36933135986328 0 56.9548225402832 0 C 56.54030990600586 0 56.20429611206055 0.3360422551631927 56.20429611206055 0.7505240440368652 L 56.20429611206055 1.598461508750916 C 54.44984436035156 1.947316288948059 53.12737655639648 3.495201349258423 53.12737655639648 5.352122783660889 C 53.12737655639648 6.079075813293457 53.12737655639648 7.684280395507813 53.12737655639648 8.105628967285156 L 51.62495040893555 10.31266403198242 C 51.46669387817383 10.54513263702393 51.44995498657227 10.84604644775391 51.58145523071289 11.09463596343994 C 51.71295547485352 11.34322834014893 51.97110748291016 11.49869728088379 52.25234222412109 11.49869728088379 L 61.65729522705078 11.49869728088379 C 61.93852996826172 11.49869728088379 62.19668960571289 11.3431978225708 62.32818603515625 11.09463596343994 C 62.459716796875 10.84601402282715 62.44295120239258 10.54510021209717 62.28471755981445 10.31263160705566 Z" fill="#d9d9d9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yqb6y4 =
    '<svg viewBox="0.0 0.0 10.9 14.1" ><path transform="translate(-171.41, -392.11)" d="M 175.207275390625 404.5139770507813 C 175.2072296142578 404.5176391601563 175.2069854736328 404.5213012695313 175.2069854736328 404.5249633789063 C 175.2069854736328 405.4469604492188 175.9543762207031 406.1943359375 176.8763427734375 406.1943359375 C 177.7983093261719 406.1943359375 178.5457153320313 405.4469604492188 178.5457153320313 404.5249633789063 C 178.5457153320313 404.5213012695313 178.5454711914063 404.5176391601563 178.5454254150391 404.5139770507813 L 175.207275390625 404.5139770507813 Z" fill="#d9d9d9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-51.49, 0.0)" d="M 62.28471755981445 10.31263160705566 L 60.78229141235352 8.105597496032715 C 60.78229141235352 7.429987907409668 60.78229141235352 5.779140949249268 60.78229141235352 5.352091789245605 C 60.78229141235352 3.495138883590698 59.4598274230957 1.947254061698914 57.70537567138672 1.598429918289185 L 57.70537567138672 0.7505240440368652 C 57.70534515380859 0.3360422551631927 57.36933135986328 0 56.9548225402832 0 C 56.54030990600586 0 56.20429611206055 0.3360422551631927 56.20429611206055 0.7505240440368652 L 56.20429611206055 1.598461508750916 C 54.44984436035156 1.947316288948059 53.12737655639648 3.495201349258423 53.12737655639648 5.352122783660889 C 53.12737655639648 6.079075813293457 53.12737655639648 7.684280395507813 53.12737655639648 8.105628967285156 L 51.62495040893555 10.31266403198242 C 51.46669387817383 10.54513263702393 51.44995498657227 10.84604644775391 51.58145523071289 11.09463596343994 C 51.71295547485352 11.34322834014893 51.97110748291016 11.49869728088379 52.25234222412109 11.49869728088379 L 61.65729522705078 11.49869728088379 C 61.93852996826172 11.49869728088379 62.19668960571289 11.3431978225708 62.32818603515625 11.09463596343994 C 62.459716796875 10.84601402282715 62.44295120239258 10.54510021209717 62.28471755981445 10.31263160705566 Z" fill="#FFDC00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z5akyg =
    '<svg viewBox="0.1 0.0 120.0 164.9" ><path transform="translate(0.0, -65.33)" d="M 15.07304286956787 87.81639862060547 L 105.039665222168 87.81639862060547 C 113.3212585449219 87.81639862060547 120.0343704223633 94.52940368652344 120.0343704223633 102.8112487792969 L 120.0343704223633 215.2701721191406 C 120.0343704223633 223.5520172119141 113.3212585449219 230.2651214599609 105.039665222168 230.2651214599609 L 15.07304286956787 230.2651214599609 C 6.791232585906982 230.2651214599609 0.078125 223.5520172119141 0.078125 215.2701721191406 L 0.078125 102.8112487792969 C 0.078125 94.53042602539063 6.791232585906982 87.81639862060547 15.07304286956787 87.81639862060547 Z M 15.07304286956787 87.81639862060547" fill="#d5daff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-65.33, -130.65)" d="M 170.3646697998047 175.6369934082031 L 95.39197540283203 175.6369934082031 C 91.25209045410156 175.6369934082031 87.89450073242188 178.9934234619141 87.89450073242188 183.1343383789063 L 87.89450073242188 280.5983276367188 C 87.89450073242188 284.7392272949219 91.25106048583984 288.0958862304688 95.39197540283203 288.0958862304688 L 156.6572418212891 288.0958862304688 C 160.6329650878906 288.0958862304688 164.4478302001953 286.5161743164063 167.2592468261719 283.7047729492188 L 173.4701232910156 277.493896484375 C 176.2822875976563 274.6817321777344 177.8620300292969 270.8678588867188 177.8620300292969 266.89111328125 L 177.8620300292969 183.1343383789063 C 177.8620300292969 178.9934234619141 174.5055847167969 175.6369934082031 170.3646697998047 175.6369934082031 Z M 170.3646697998047 175.6369934082031" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-43.55, -108.88)" d="M 146.3954162597656 238.5265960693359 L 128.2960662841797 256.6259765625 C 126.8894577026367 258.0325622558594 124.9826507568359 258.8219299316406 122.9946594238281 258.8219299316406 L 66.12145233154297 258.8219299316406 C 61.98155975341797 258.8219299316406 58.625 255.4654998779297 58.625 251.3256225585938 L 58.625 153.8606109619141 C 58.625 149.7196807861328 61.98155975341797 146.3630065917969 66.12145233154297 146.3630065917969 L 141.0950622558594 146.3630065917969 C 145.2349395751953 146.3630065917969 148.5916290283203 149.7196807861328 148.5916290283203 153.8606109619141 L 148.5916290283203 233.2252044677734 C 148.5916290283203 235.2129516601563 147.8022766113281 237.1210327148438 146.3954162597656 238.5265960693359 Z M 146.3954162597656 238.5265960693359" fill="#e4e7fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-65.33, -108.88)" d="M 95.39197540283203 146.3630065917969 L 155.3707580566406 146.3630065917969 C 159.5106506347656 146.3630065917969 162.8670806884766 149.7196807861328 162.8670806884766 153.8606109619141 C 162.8670806884766 158.0015258789063 159.5106506347656 161.3579559326172 155.3707580566406 161.3579559326172 L 95.39197540283203 161.3579559326172 C 91.25106048583984 161.3579559326172 87.89450073242188 158.0015258789063 87.89450073242188 153.8606109619141 C 87.89450073242188 149.7196807861328 91.25106048583984 146.3630065917969 95.39197540283203 146.3630065917969 Z M 95.39197540283203 146.3630065917969" fill="#c2cbff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-65.33, 0.0)" d="M 151.6219635009766 22.49137687683105 L 147.8731536865234 22.49137687683105 C 147.8731536865234 10.06964492797852 137.8036041259766 0 125.380859375 0 C 112.9591217041016 0 102.8893280029297 10.06964492797852 102.8893280029297 22.49137687683105 L 99.14077758789063 22.49137687683105 C 92.92991638183594 22.49137687683105 87.89450073242188 27.52681350708008 87.89450073242188 33.7376823425293 C 87.89450073242188 39.94854736328125 92.92991638183594 44.98382568359375 99.14077758789063 44.98382568359375 L 151.6219635009766 44.98382568359375 C 157.8328094482422 44.98382568359375 162.8681030273438 39.94854736328125 162.8681030273438 33.7376823425293 C 162.8681030273438 27.52681350708008 157.8328094482422 22.49137687683105 151.6219635009766 22.49137687683105 Z M 125.380859375 29.98887634277344 C 121.240966796875 29.98887634277344 117.8832397460938 26.63219451904297 117.8832397460938 22.49137687683105 C 117.8832397460938 18.35145568847656 121.2399291992188 14.99392604827881 125.380859375 14.99392604827881 C 129.5217742919922 14.99392604827881 132.8782043457031 18.3504581451416 132.8782043457031 22.49137687683105 C 132.8782043457031 26.63219451904297 129.5217742919922 29.98887634277344 125.380859375 29.98887634277344 Z M 125.380859375 29.98887634277344" fill="#7d8fac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
