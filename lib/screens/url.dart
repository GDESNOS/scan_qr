import 'dart:ui';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
/*
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet1_iw/widgets/qrProvider.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:waohqr/screens/voir_qr_cree.dart';
import 'package:waohqr/widgets/boxes.dart';
import 'package:waohqr/widgets/qr.dart';

import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/menu_Element.dart';
import 'package:qr_flutter/qr_flutter.dart';

class URL extends StatefulWidget {
  const URL({super.key});
  @override
  State<URL> createState() => _URLState();
}
@override
class _URLState extends State<URL> {
  String recupere_saisi='';
  bool visible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonVisible = false;
  final TextEditingController urlText = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey _globalKey = GlobalKey();
  int i = 0;


  @override
  Widget build(BuildContext context) {
   /*2 enregistre = Hive.box('qrCode');
    i = i + 1;*/
    //Password urlText = Password(title: 'Url', placeholder: 'http://');
    //urlText.err1 = "Veuillez-renseigner une bonne Url";

    return Scaffold(
      key: _scaffoldKey,
      appBar:  AppBar(
        backgroundColor: Color(0xff140344),
        shadowColor: Color(0xff140344),
        title: Text('Créer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 50,
            child: buildRow(Icons.all_inclusive_outlined, "Url", ontap: () {
            }),
          ),
          SizedBox(
            height: 20,
          ),

         Center(
              child: RepaintBoundary(
                key: _globalKey,
                child: QrImage(
                  data: recupere_saisi,
                  size: 220,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                ),
              )),
          Visibility(
            visible: visible,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                      'Aucun QR disponible, veuillez renseigner le champ'),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                //maxLines: 8,
                  controller: urlText,
                  onChanged: (e) {
                    print('Nom saisi : $recupere_saisi');
                    recupere_saisi = urlText.text;
                    setState(() {
                      visible = e.isEmpty;
                    });
                  },
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "Veuillez renseigner une URL";
                    } else {
                      // Ajoutez ici votre logique de validation avec le modèle de regex
                      Pattern pattern = r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*(com|\.)[^\s]+$';
                      RegExp regex = RegExp(pattern as String);

                      if (!regex.hasMatch(e)) {
                        return "L'URL doit commencer par http et finir par .com";
                      }
                    }
                    return null; // La validation réussit
                  },
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: "http:/",
                    labelText: "URL",
                    labelStyle: TextStyle(color: Color(0xff140344)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xff140344),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xff140344),
                      ),
                    ),
                  )),
            )
          ),

          SizedBox(height: 16),
          Builder(
            builder: (BuildContext context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Votre URL a été enregistrée avec succès'),
                        ),
                      );
                      setState(() {
                        _isButtonVisible = true;
                      });
                    }
                    //Insertion dans la base de donneses de hive
                    setState(() {
                      boxqr_code.put('key_${urlText.text}',
                          Qr(id: i, categorie:recupere_saisi, Type: "URL", description:urlText.text , dates: DateTime.now()));
                    });
                    saveImageToGallery(_globalKey);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff140344),
                    fixedSize: Size(130, 45),
                  ),
                  child: Text('Enregistrer'),
                ),
              );

            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: _isButtonVisible,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      RenderRepaintBoundary boundary = _globalKey
                          .currentContext!
                          .findRenderObject()
                      as RenderRepaintBoundary;
                      //captures qr image
                      var image = await boundary.toImage();
                      ByteData? byteData = await image.toByteData(
                          format: ImageByteFormat.png);
                      Uint8List pngBytes =
                      byteData!.buffer.asUint8List();
                      //app directory for storing images.
                      final appDir =
                      await getApplicationDocumentsDirectory();
                      //current time
                      var datetime = DateTime.now();
                      final file =
                      await File('${appDir.path}/$datetime.png')
                          .create();
                      //appending data
                      await file.writeAsBytes(pngBytes);
                      // Logique pour le bouton "Partager"
                      await Share.shareFiles(
                        [file.path],
                        text: recupere_saisi,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff140344),
                      fixedSize: Size(130, 45),
                    ),
                    child: Text("Partager"),
                  ),
                ),
              ),
              Visibility(
                visible: _isButtonVisible,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Voir_qr_cree(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff140344),
                      fixedSize: Size(130, 45),
                    ),
                    child: Text('voir qr_crée'),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

/*  Future<void> _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    print(info);
    //_toastInfo(info);
  }*/
  Future<void> saveImageToGallery(GlobalKey _globalKey) async {
    try {
      RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      // Capture l'image du RepaintBoundary
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Obtenez le répertoire d'application local
      Directory appDir = await getApplicationDocumentsDirectory();

      // Créez un fichier pour stocker l'image
      File file = File('${appDir.path}/qr_image.png');
      await file.writeAsBytes(pngBytes);

      // Enregistrez l'image dans la galerie du téléphone
      final result = await ImageGallerySaver.saveImage(pngBytes);

      if (result['isSuccess']) {
        print('L\'image a été enregistrée avec succès dans la galerie.');
      } else {
        print('Erreur lors de l\'enregistrement de l\'image : ${result['errorMessage']}');
      }
    } catch (e) {
      print('Erreur lors de l\'enregistrement de l\'image : $e');
    }
  }
  Future<void> _saveScreen() async {
    RenderRepaintBoundary boundary =
    _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
    await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
      await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
    }
  }

}

