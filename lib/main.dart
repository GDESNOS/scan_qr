import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waohqr/screens/historique.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'widgets/boxes.dart';
import 'widgets/qr.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QrAdapter());
   boxqr_code = await Hive.openBox<Qr>('qrBox');

  runApp(
      const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHome()
      ));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: History(),
    );
  }
}


