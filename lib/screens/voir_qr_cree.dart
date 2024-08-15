import 'package:flutter/material.dart';
import 'package:waohqr/widgets/boxes.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

import '../widgets/qr.dart';

class Voir_qr_cree extends StatefulWidget {
  const Voir_qr_cree({super.key});

  @override
  State<Voir_qr_cree> createState() => _Voir_qr_creeState();
}

class _Voir_qr_creeState extends State<Voir_qr_cree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff140344),
        shadowColor: Color(0xff140344),
        title: Text('Historique',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: ListView.builder(
        itemCount: boxqr_code.length,
          itemBuilder: ((context, index) {
        Qr qr = boxqr_code.getAt(index);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff140344), width: 0.5)),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child:QrImage(
                          data: qr.categorie,
                          size: 150,
                          version: QrVersions.auto,
                          backgroundColor: Colors.white,
                        ) ,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(qr.Type, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(width: 100,),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                boxqr_code.deleteAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(qr.description),
                      SizedBox(height: 30,),
                      Text(
                        DateFormat('dd/MM/yyyy H:m:s').format(qr.dates),
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular', fontSize: 10),
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
        );
      })
      )
    );
  }
}
