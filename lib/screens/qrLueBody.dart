import 'package:flutter/material.dart';
import 'package:waohqr/screens/scanScreen.dart';

class QrLueBody extends StatefulWidget {
  const QrLueBody({super.key});

  @override
  State<QrLueBody> createState() => _QrLueBodyState();
}

class _QrLueBodyState extends State<QrLueBody> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Center(
              child: Container(
               width: size.width*0.80,
                child: Image(image: AssetImage('image/WAOHQR.png')),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: Container(
                  width: size.width*0.70,
                    padding: EdgeInsets.all(6.0), // Ajout de marge intérieure pour la bordure
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Couleur de la bordure
                        width: 2.0, // Largeur de la bordure
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Rayon de bordure (pour les coins arrondis)
                    ),
                    child: Text("Cliquez sur le bouton pour scanner un  QR code",
                      style: TextStyle(color: Colors.black,
                      fontSize: 20.0, fontFamily: 'Arial', ),)))
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScanScreen(),
          ));
        },
        tooltip: 'Scanner',
        backgroundColor: Color(0xff140344), // Couleur de fond spécifiée
        child: Icon(Icons.crop_free), // Icône de scanner
      ),

    );
  }
}
