import 'package:flutter/cupertino.dart';
import 'package:waohqr/widgets/qr.dart';
import 'package:provider/provider.dart';

final qrProvider = ChangeNotifierProvider(
      create: (_) => QrCodeProvider(),
);

class QrCodeProvider extends ChangeNotifier {
  QrCodeProvider() : super();

  String? qrData;
  DateTime dates = DateTime.now();
  List createQrs = [];

  List scannedQrs = [];

  Future createQr(int id, String cat, String types, String description) async {
    DateTime dates = DateTime.now();
    final createQr = Qr(
        id: id,
        categorie: cat,
        Type: types,
        description: description,
        dates: dates);
    createQrs.add(createQr);
    notifyListeners();
  }
}

