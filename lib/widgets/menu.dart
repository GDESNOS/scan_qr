import 'package:flutter/material.dart';
import 'package:waohqr/widgets/menu_Element.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image(image: AssetImage('image/smart1.png')),
          ),
          Column(children: [
            buildRow(Icons.home, "Accueil", ontap: () {
              changerPage('/accueil');
            }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            buildRow(Icons.crop_free, "Scan", ontap: () {
              changerPage('/scann');
            }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            buildRow(Icons.create, "Créer QR", ontap: () {
              changerPage('/createQR');
            }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            buildRow(Icons.history, "Historique", ontap: () {
              changerPage('/history');
            }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            buildRow(Icons.settings, "Paramètres", ontap: () {
              changerPage('/parametre');
            }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            buildRow(Icons.error_outline, "A propos", ontap: () {
              changerPage('/apropos');
            }),
          ])
        ],
      ),
    );
  }

  changerPage(page) {
    Navigator.pushNamed(context, page);
  }
}
