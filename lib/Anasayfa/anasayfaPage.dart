import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ui/altmenubar.dart';
import '../Projeler/projeler.dart';
import '../Projeler/ui/appbar2.dart';
import 'ui/appbar.dart';
import 'ui/yenigorev.dart';
import 'ui/Gorev.dart';
import 'package:sqflite/sqflite.dart';
import 'ui/GorevVar.dart';

class Yapilacaklar extends StatefulWidget {
  Database db;

  Yapilacaklar([this.db]);
  @override
  _YapilacaklarState createState() => _YapilacaklarState();
}

class _YapilacaklarState extends State<Yapilacaklar> {
  double gorevyazMargin =
      1; //  bu alttan çıkması için animasyon degiskeni top margin ekrandan maksimum uzaklıkta basta gozukmuyor sonra ben + butonuna basınca o margin degeri top : 0.14 oluyor şu an ki hali tekrar kapat butonuna basınca top margin maksimum uzaklıkta
  double opacity = 0; //bu da golge
  int id;
  bool gorunur =
      false; //projelere gecis bool degiskeni ,eger projelere basildiysa true olur
  List<Gorev> mevcutGorevler = []; //gorevler listesi

  getGorevler() async {
    mevcutGorevler = [];
    //gorevleri oku
    List<Map> gorevlerQuery = //gorevleri sorgula
        await widget.db.rawQuery(//otomatik key ataması in sql
            //delete ve update
            "SELECT * FROM gorevler"); //db tabanından sorgula gorevler uzerinden * tüm hepsi anlamına gelir
    //gorevlerdeki tüm listeyi oku

    for (var i in gorevlerQuery) {
      //indexleme
      String name = i["name"]; //0 indexten ne kadar girildiyse göster
      id = i["id"];

      Gorev yeniGorev = Gorev(id: id, title: name); //gosterilecek sınıflandırma

      setState(() {
        print("Veriler Okundu");
        mevcutGorevler.add(yeniGorev); //gorevlere yenisini ekle .

        //print("id : $id"); //idler farkli
      });
    }
  }

  Future kaydet(Gorev gorev) async {
    //insert işlemi
    String title = gorev.title; //gorevin metnini yerleştir
    widget.db.rawInsert(
        "INSERT INTO Gorev(id, title) VALUES(0, $title)"); //idsi 0 olan gorevin metnini yerleştir
  }

  //silme işlemi
  //#TODO:istenilen şey gorev cıntaineri sola doğru kaydığında delete iconu çıksın ve tıkladığımda silinsin

  @override
  void initState() {
    getGorevler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9FCFF),
      child: Stack(
        children: <Widget>[
          mevcutGorevler.isEmpty
              ? gorevYok(context)
              : GorevVar(
                  gorevler: mevcutGorevler,
                  db: widget.db,
                  getGorevler: getGorevler,
                  id: id),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.88),
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
                });
              },
              aktif1: gorunur ? false : true,
              aktif2: gorunur ? true : false,
            ),
          ),
          if (gorevyazMargin ==
              0.14) //eger yaklasmissa ekranın arkasını golgele
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              color: Colors.black.withOpacity(opacity), //bursı golge
              width: double.infinity,
              height: double.infinity,
            )
          else
            Container(), //degilse bos container dondur
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    gorevyazMargin), //burada childin top marginini setstate de verilen degere gore ayarla
            child: YeniGorevModal(
              getGorevler: getGorevler,
              db: widget.db,
              //database e kaydetmek icin buradan cektigi database üzerine kaydedecek
              //childe buna gore ayarlanır
              closeFunc: () {
                setState(
                  () {
                    gorevyazMargin = 1;
                    opacity = 0;
                  },
                );
              },
            ),
          ),
          if (gorunur)
            AnimatedContainer(
              height: double.infinity,
              width: double.infinity,
              duration: Duration(milliseconds: 400),
              child: Projeler(
                db: widget.db,
                gorevler: mevcutGorevler,
              ),
            )
          else
            Container()
        ],
      ),
    );
  }
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
                    fontFamily: 'Rubik-Medium',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF554E8F),
                    fontSize: 27),
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

const String _svg_z5akyg =
    '<svg viewBox="0.1 0.0 120.0 164.9" ><path transform="translate(0.0, -65.33)" d="M 15.07304286956787 87.81639862060547 L 105.039665222168 87.81639862060547 C 113.3212585449219 87.81639862060547 120.0343704223633 94.52940368652344 120.0343704223633 102.8112487792969 L 120.0343704223633 215.2701721191406 C 120.0343704223633 223.5520172119141 113.3212585449219 230.2651214599609 105.039665222168 230.2651214599609 L 15.07304286956787 230.2651214599609 C 6.791232585906982 230.2651214599609 0.078125 223.5520172119141 0.078125 215.2701721191406 L 0.078125 102.8112487792969 C 0.078125 94.53042602539063 6.791232585906982 87.81639862060547 15.07304286956787 87.81639862060547 Z M 15.07304286956787 87.81639862060547" fill="#d5daff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-65.33, -130.65)" d="M 170.3646697998047 175.6369934082031 L 95.39197540283203 175.6369934082031 C 91.25209045410156 175.6369934082031 87.89450073242188 178.9934234619141 87.89450073242188 183.1343383789063 L 87.89450073242188 280.5983276367188 C 87.89450073242188 284.7392272949219 91.25106048583984 288.0958862304688 95.39197540283203 288.0958862304688 L 156.6572418212891 288.0958862304688 C 160.6329650878906 288.0958862304688 164.4478302001953 286.5161743164063 167.2592468261719 283.7047729492188 L 173.4701232910156 277.493896484375 C 176.2822875976563 274.6817321777344 177.8620300292969 270.8678588867188 177.8620300292969 266.89111328125 L 177.8620300292969 183.1343383789063 C 177.8620300292969 178.9934234619141 174.5055847167969 175.6369934082031 170.3646697998047 175.6369934082031 Z M 170.3646697998047 175.6369934082031" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-43.55, -108.88)" d="M 146.3954162597656 238.5265960693359 L 128.2960662841797 256.6259765625 C 126.8894577026367 258.0325622558594 124.9826507568359 258.8219299316406 122.9946594238281 258.8219299316406 L 66.12145233154297 258.8219299316406 C 61.98155975341797 258.8219299316406 58.625 255.4654998779297 58.625 251.3256225585938 L 58.625 153.8606109619141 C 58.625 149.7196807861328 61.98155975341797 146.3630065917969 66.12145233154297 146.3630065917969 L 141.0950622558594 146.3630065917969 C 145.2349395751953 146.3630065917969 148.5916290283203 149.7196807861328 148.5916290283203 153.8606109619141 L 148.5916290283203 233.2252044677734 C 148.5916290283203 235.2129516601563 147.8022766113281 237.1210327148438 146.3954162597656 238.5265960693359 Z M 146.3954162597656 238.5265960693359" fill="#e4e7fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-65.33, -108.88)" d="M 95.39197540283203 146.3630065917969 L 155.3707580566406 146.3630065917969 C 159.5106506347656 146.3630065917969 162.8670806884766 149.7196807861328 162.8670806884766 153.8606109619141 C 162.8670806884766 158.0015258789063 159.5106506347656 161.3579559326172 155.3707580566406 161.3579559326172 L 95.39197540283203 161.3579559326172 C 91.25106048583984 161.3579559326172 87.89450073242188 158.0015258789063 87.89450073242188 153.8606109619141 C 87.89450073242188 149.7196807861328 91.25106048583984 146.3630065917969 95.39197540283203 146.3630065917969 Z M 95.39197540283203 146.3630065917969" fill="#c2cbff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-65.33, 0.0)" d="M 151.6219635009766 22.49137687683105 L 147.8731536865234 22.49137687683105 C 147.8731536865234 10.06964492797852 137.8036041259766 0 125.380859375 0 C 112.9591217041016 0 102.8893280029297 10.06964492797852 102.8893280029297 22.49137687683105 L 99.14077758789063 22.49137687683105 C 92.92991638183594 22.49137687683105 87.89450073242188 27.52681350708008 87.89450073242188 33.7376823425293 C 87.89450073242188 39.94854736328125 92.92991638183594 44.98382568359375 99.14077758789063 44.98382568359375 L 151.6219635009766 44.98382568359375 C 157.8328094482422 44.98382568359375 162.8681030273438 39.94854736328125 162.8681030273438 33.7376823425293 C 162.8681030273438 27.52681350708008 157.8328094482422 22.49137687683105 151.6219635009766 22.49137687683105 Z M 125.380859375 29.98887634277344 C 121.240966796875 29.98887634277344 117.8832397460938 26.63219451904297 117.8832397460938 22.49137687683105 C 117.8832397460938 18.35145568847656 121.2399291992188 14.99392604827881 125.380859375 14.99392604827881 C 129.5217742919922 14.99392604827881 132.8782043457031 18.3504581451416 132.8782043457031 22.49137687683105 C 132.8782043457031 26.63219451904297 129.5217742919922 29.98887634277344 125.380859375 29.98887634277344 Z M 125.380859375 29.98887634277344" fill="#7d8fac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
