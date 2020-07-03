import 'package:flutter/material.dart';
import './Onboarding/Onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yapilacaklar',
      home: MyHomePage(title: 'Yapilacaklar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xfff9fcff),
      body: Onboarding(),
    );
  }
}
/*
class Ornek extends StatefulWidget {
  @override
  _OrnekState createState() => _OrnekState();
}

class _OrnekState extends State<Ornek> {
  String not;
  List notListesi = List();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            child: Form(
              // bir dakika
              key: formKey,
              child: TextFormField(
                onSaved: (deger) {
                  not = deger;
                },
                decoration: InputDecoration(
                  hintText: "Notunuzu giriniz",
                  labelText: "Not",
                ),
              ),
            ),
          ),
        ),
        RaisedButton(onPressed: (){ 
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notlarim(notListesi:notListesi));
        }),
        RaisedButton(
          onPressed: () {
            setState(() {
              formKey.currentState.save();
              notListesi.add(not);
            });
            print(not);
          }, // 1 dakikanı istiyorum :D
          child: Text("Notu Kaydet"),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: notListesi.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(notListesi[index]),
              );
            })
      ],
    );
  }
}
*/
