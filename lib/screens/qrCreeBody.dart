import 'package:flutter/material.dart';
import 'package:waohqr/screens/creationQR.dart';

class QrCreeBody extends StatefulWidget {
  const QrCreeBody({super.key});

  @override
  State<QrCreeBody> createState() => _QrCreeBodyState();
}

class _QrCreeBodyState extends State<QrCreeBody> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Container(
                width: size.width*0.70,
                child: Image(image: AssetImage('image/qr-code.jpg') ),
                //child: Image(image: AssetImage('image/sans fond.png') ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child:Container(
                  width: size.width * 0.70,
                  padding: EdgeInsets.all(6.0), // Ajout de marge intérieure pour la bordure
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Couleur de la bordure
                      width: 2.0, // Largeur de la bordure
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Rayon de bordure (pour les coins arrondis)
                  ),
                  child: Text(
                    "Cliquez sur le bouton pour créer un QR code",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      fontFamily: 'Arial',
                    ),
                  ),
                )
            )
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateQR(),
          ));
        },
        tooltip: 'Scanner',
        backgroundColor: Color(0xff140344),
        child: Icon(Icons.add), // Icône de scanner
      ),
    );
  }
}
