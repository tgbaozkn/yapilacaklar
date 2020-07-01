import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'secenekler.dart';

class YeniGorev extends StatefulWidget {
  Function onTap;
  Function olustur;
  YeniGorev({this.onTap, this.olustur});

  @override
  _YeniGorevState createState() => _YeniGorevState();
}

class _YeniGorevState extends State<YeniGorev> {
  TextEditingController controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('EEE,HH:mm');
  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting('tr', null);
    final double boy = MediaQuery.of(context).size.height;
    final double en = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: boy * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(300, 60.5),
                  topRight: Radius.elliptical(300, 60.5)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: en * 0.45),
            width: boy * 0.065,
            height: boy * 0.065,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(26.5, 26.5)),
              gradient: LinearGradient(
                colors: [const Color(0xfff857c3), const Color(0xffe0139c)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x78f456c3),
                  offset: Offset(0, 7),
                  blurRadius: 9,
                ),
              ],
            ),
          ),
          Positioned(
              left: en * 0.445,
              bottom: boy * 0.96,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => widget.onTap(),
                color: Colors.white,
                iconSize: boy * 0.05,
              )),
          Column(
            children: [
              SizedBox(
                height: boy * 0.08,
              ),
              Center(
                child: Text(
                  "Yeni görev ekle",
                  style: TextStyle(
                      color: Color(0xff404040),
                      fontSize: boy * 0.022,
                      fontFamily: 'Rubik-Medium',
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: en * 0.05, top: en * 0.1),
                width: en * 0.88,
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff373737),
                    fontSize: 20,
                    fontFamily: 'Rubik-Regular',
                  ),
                  onSubmitted: (value) {},
                  controller: controller,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Secenekler(),
              Divider(
                indent: en * 0.09,
                endIndent: en * 0.03,
                thickness: 0.6,
                color: Colors.black,
              ),
              FlatButton(
                onPressed: () async {
                  final selectedDate = await _selectDateTime(context);
                  if (selectedDate == null) return;

                  print(selectedDate);

                  final selectedTime = await _selectTime(context);
                  if (selectedTime == null) return;
                  print(selectedTime);

                  setState(() {
                    this.selectedDate = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                  });
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: en * 0.05,
                      height: boy * 0.15,
                    ),
                    Text("Tarih Seç            "),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, en * 0.65, 0),
                child: Text(DateTime.now().day ==
                        selectedDate.day // if datetime.now + 1 = selected.day
                    ? DateFormat('Bugün,HH:mm').format(selectedDate)
                    : DateFormat('EEE,HH:mm').format(selectedDate)),
              ),
              //Text(Jiffy(selectedDate).format('EEE,HH:dd')) //Mon,18:22,
              SizedBox(height: boy * 0.098),
              olustur(context, () {
                setState(() {
                  print("basıldı");
                  String text = controller.text;
                  print(text);
                  selectedDate;
                  print(selectedDate);
                });
              }),
            ],
          ),
        ],
      ),
    );
  }
}

Widget olustur(BuildContext context, Function func) {
  return GestureDetector(
    onTap: () {
      print("Olusturuldu");
      func();
    },
    child: Container(
      child: Center(
          child: Text(
        "Oluştur",
        style: TextStyle(
          fontFamily: 'Rubik-Medium',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height * 0.032,
        ),
      )),
      width: MediaQuery.of(context).size.width * 0.86,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Color(0xFF7EB6FF),
            Color(0xFF5F87E7),
          ],
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 6, offset: Offset(0, 3), color: Color(0xFF6894EE)),
        ],
      ),
    ),
  );
}

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = TimeOfDay.now();

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  );
}

Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
