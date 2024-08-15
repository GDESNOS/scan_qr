import 'dart:developer';
import 'dart:io';

/*
import 'package:image_picker/image_picker.dart';
*/
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:clipboard/clipboard.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Barcode? result;
  QRViewController? controller;
  String _qrfile = '';

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late String wifiNomLire,
      wifiTypeLire,
      wifiPassLire,
      wifiNomsLire,
      wifiPasssLire,
      wifiTypesLire;


  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildQrView(context),
          Positioned(top: 30, child: buildControlButtons()),
          if (_qrfile != null && result?.code?.substring(0,4) == "http")
            Positioned(
               bottom: 30, child: buildResultLireUrl("Url", "$result"))
          else if (_qrfile != null && result?.code?.substring(0,4) == "WIFI")
            Positioned(
                bottom: 30, child: buildResultWifi("wifi", "$result"))

          /*  else if (_qrfile != null && result?.code?.substring(0,10) == "MATMSG:TO:")
            Positioned(
                bottom: 30, child: buildResulUrl("Email", "$result"))

              if (result != null)
          Container(
            color: Colors.white,
            child:
        Text(
    'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}', style: TextStyle(
    color: Colors.black,),)
          ),
     Text(
    ' ',
    style: TextStyle(fontSize: 16.0),
    ),*/

          /*Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: IconButton(
                          icon: Icon(Icons.play_arrow,  color: Colors.white,),
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },

                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )*/
        ],
      ),
    );
  }
  /*Widget buildResultUrl(BuildContext context, String format, String url) {
    return Container(
        width: MediaQuery.of(context).size.width * 1.20,
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(format),

              ],
            ),
            titlePadding: EdgeInsets.all(20),
            content: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '${result?.code} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              if (await launchUrl(Uri.parse(url)))
                                throw 'Could not launch Uri.parse($url)';
                            },
                            icon: Icon(
                              Icons.input,
                              color: Color(0xffff5757),
                            )),
                        TextButton(
                            onPressed: () async {
                              if (await launchUrl(Uri.parse(url)))
                                throw 'Could not launch Uri.parse($url)';
                            },
                            child: Text(
                              'Ouvrir dans\nun navigateur',
                              style: TextStyle(color: Color(0xffff5757)),
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await Share.share('${result!.code}');
                            },
                            icon: Icon(
                              Icons.share,
                              color: Color(0xffff5757),
                            )),
                        TextButton(
                          onPressed: () async {
                            await Share.share('${result!.code}');
                          },
                          child: Text(
                            'Partager',
                            style: TextStyle(color: Color(0xffff5757)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            contentPadding: EdgeInsets.all(20),
          ),
        ));
  }*/

  //Widget pour la lecture des codes qr en URL

  Widget buildResultLireUrl(String type, String url) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type),
              ],
            ),
            titlePadding: EdgeInsets.all(20),
            content: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '${result!.code}\n ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                            url=result!.code!;
                              if (await launchUrl(Uri.parse(url))){
                                print("Url ouverte");
                              }else{
                                print("Url non ouverte");
                                throw 'Could not launch Uri.parse($url)';
                              }
                            },
                            icon: Icon(
                              Icons.input,
                              color: Color(0xffff5757),
                            )),
                        TextButton(
                            onPressed: () async {
                              url=result!.code!;
                              if (await launchUrl(Uri.parse(url))){
                                print("Url ouverte");
                              }else{
                                throw 'Could not launch Uri.parse($url)';
                              }
                            },
                            child: Text(
                              'Ouvrir dans\nun navigateur',
                              style: TextStyle(color: Color(0xffff5757)),
                            ))
                      ],
                    ),

                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await Share.share('${result!.code}');
                            },
                            icon: Icon(
                              Icons.share,
                              color: Color(0xffff5757),
                            )),
                        TextButton(
                            onPressed: () async {
                              await Share.share('${result!.code}');
                            },
                            child: Text(
                              'Partager',
                              style: TextStyle(color: Color(0xffff5757)),
                            ))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Fermer',
                      style: TextStyle(color: Color(0xffff5757)),
                    ))
              ],
            ),
            contentPadding: EdgeInsets.all(20),
          ),
        ));
  }
//Widget pour la lecture des codes qr en wifi

  Widget buildResultWifi(String type, String wifi) {
    List<String> _wifi = [];
    _wifi = wifi.split(";");
    wifiNomLire = _wifi[0].trim();
    wifiTypeLire = _wifi[1].trim();
    wifiPassLire = _wifi[2].trim();

    // récupération des paramètres
    wifiNomsLire = wifiNomLire.substring(7, wifiNomLire.length);
    wifiPasssLire = wifiPassLire.substring(2, wifiPassLire.length);

    return Container(
        width: MediaQuery.of(context).size.width * 1.10,
        height: MediaQuery.of(context).size.height * 1.20,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type),
              ],
            ),
            titlePadding: EdgeInsets.all(20),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Réseau : $wifiNomsLire ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Mot de passe : $wifiPasssLire ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.copy,
                    ),
                    title: Text(
                      'Copier le réseau',
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      FlutterClipboard.copy(wifiNomsLire)
                          .then((value) => print('copied text'));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.copy,
                    ),
                    title: Text(
                      'Copier le mot de passe',
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      FlutterClipboard.copy(wifiPasssLire)
                          .then((value) => print('copied text'));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await Share.share('${result!.code}');
                              },
                              icon: Icon(
                                Icons.share,
                                color: Color(0xffff5757),
                              )),
                          Text(
                            'Partager',
                            style: TextStyle(color: Color(0xffff5757)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Fermer',
                            style: TextStyle(color: Color(0xffff5757)),
                          ))
                    ],
                  )
                ],
              ),
            ),
            contentPadding: EdgeInsets.all(20),
          ),
        ));
  }
  Widget buildControlButtons() => Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white24),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () async {
              await controller?.toggleFlash();
            },
            icon: FutureBuilder<bool?>(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(
                    snapshot.data! ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  );
                } else {
                  return Container();
                }
              },
            )),
        IconButton(
          onPressed: () async {
            await controller?.flipCamera();
          },
          icon: FutureBuilder(
            future: controller?.getCameraInfo(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(
                  Icons.switch_camera,
                  color: Colors.white,
                );
              } else {
                return Container();
              }
            },
          ),
        ),

        //Insertion de l'icon de la galery

        /*IconButton(
            onPressed: () async {
              await Permission.storage.request();
              var status = await Permission.storage.status;
              if (status.isGranted) {
                _getPhotoByGallery();
                final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                if(pickedFile != null){
                  setState(() {
                    _imageFile = File(pickedFile.path);
                  });
                }
              }
            },
            icon: Icon(
              Icons.image,
              color: Colors.white,
            )),*/
        IconButton(
          icon: Icon(Icons.play_circle,  color: Colors.white,),
          onPressed: () async {
            await controller?.pauseCamera();
          },

        ),
        IconButton(
          icon: Icon(Icons.pause_circle,  color: Colors.white,),
          onPressed: () async {
            await controller?.resumeCamera();
          },
        ),

      ],
    ),
  );
//Creation du cadre de scannage

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}