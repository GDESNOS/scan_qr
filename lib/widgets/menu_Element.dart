// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


Widget buildRow(IconData icon, String title, {Function? ontap}) {
  return ListTile(
    leading: Icon(icon, color: Color(0xff140344), size: 25),
    title: Text(title,
        style: TextStyle(
            fontFamily: 'GothamBold',
            fontSize: 15,
            color: Color(0xff140344))),
    onTap: () {
      try {
        ontap!();
      } catch (e) {}
    },
  );
}

Widget floatbouton(IconData icon, {Function? ontap}) {
  return FloatingActionButton(
    // ignore: sort_child_properties_last
    child: Icon(icon),
    backgroundColor: Color(0xff140344),
    onPressed: () {
      try {
        ontap!();
      } catch (e) {}
    },
  );
}



Widget bouton (IconData icon, Color couleur, String nom, {Function? ontap}){
  return IconButton(
    onPressed: () {
      try {
        ontap!();
      } catch (e) {}
    },
    icon: Icon(
      icon, size: 40, color: couleur,
    ),
    tooltip: nom,
  );
}


// icone wifi: signal_wifi_4_bar_sharp
// icone texte : text_fields