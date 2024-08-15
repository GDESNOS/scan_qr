import 'package:flutter/material.dart';
import 'package:waohqr/screens/url.dart';
import '../widgets/menu_Element.dart';


class CreateQR extends StatelessWidget {
  CreateQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff140344),
        shadowColor: Color(0xff140344),
        title: Text('Créer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child:
                  buildRow(Icons.all_inclusive_outlined, "Url", ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => URL(),
                    ));
                  })),
            ),
            /*const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child: buildRow(Icons.text_fields, "Texte", ontap: () {
                    changerPage(context, '/texte');
                  })),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child: buildRow(Icons.email, "E-mail", ontap: () {
                    changerPage(context, '/email');
                  })),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child: buildRow(Icons.person, "Informations personnelles",
                      ontap: () {
                        changerPage(context, '/info');
                      })),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child: buildRow(Icons.calendar_month, "Agenda", ontap: () {
                    changerPage(context, '/agenda');
                  })),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child: buildRow(Icons.signal_wifi_4_bar_sharp, "Wifi",
                      ontap: () {
                        changerPage(context, '/wifi');
                      })),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Center(
                  child: buildRow(Icons.code, "Code USSD", ontap: () {
                    changerPage(context, '/code');
                  })),
            ),*/
          ],
        ),
      ),
    );
  }

  changerPage(BuildContext context, page) {
    Navigator.pushNamed(context, page);
  }
}
