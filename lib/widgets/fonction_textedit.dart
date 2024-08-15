// ignore_for_file: prefer_const_constructors, unnecessary_this, dead_code

import 'package:flutter/material.dart';

class Comment {
  late String value, err;
  late String placeholder, title;
  bool ispass;

  Comment({
    this.value = "",
    this.err = "",
    this.placeholder = "",
    this.title = "",
    this.ispass = false,
  });

  TextEditingController controller = TextEditingController();

  TextFormField commente(void ontap(e)) {
    return TextFormField(
      maxLines: 2,
      controller: controller,
      //initialValue: this.initial,
      onChanged: (e) {
        ontap(e);
      },
      validator: (e) {
        if (e == null || e.isEmpty) {
          return this.err;
        } else {
          return null;
        }
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
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
      ),
    );
  }

  // formulaire email r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  TextFormField email(void ontap(e)) {
    return TextFormField(
        controller: controller,
        onChanged: (e) {
          ontap(e);
        },
        validator: (e) {
          // Pattern pattern = r'^[a-zA-Z]+[a-zA-Z]+@[gmail]+[.]+[com]';
          Pattern pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

          RegExp regex = RegExp(pattern as String);
          if (e == null || e.isEmpty) {
            return err;
          } else if (!regex.hasMatch(e)) {
            return err;
          } else {
            return null;
          }
        },
        obscureText: ispass,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: this.placeholder,
            labelText: this.title,
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
            )));
  }

  // formulaire du code Ussd
  TextFormField code(void ontap(e)) {
    return TextFormField(
        controller: controller,
        onChanged: (e) {
          ontap(e);
        },
        validator: (e) {
          Pattern pattern = r'^(?=.*?[*])(?=.*?[1-9*1-9])(?=.*?[#]).{5,}$';
          RegExp regex = RegExp(pattern as String);
          if (e == null || e.isEmpty) {
            return err;
          } else if (!regex.hasMatch(e)) {
            return err;
          } else {
            return null;
          }
        },
        obscureText: ispass,
        decoration: InputDecoration(
            hintText: this.placeholder,
            labelText: this.title,
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
            )));
  }
}

class Texte {
  late String title;
  late String placeholder;
  late bool ispass;
  late String err1;
  late String value;

  Texte operator +(int i) => this;

  Texte({
    this.title = "",
    this.ispass = false,
    this.placeholder = "",
    this.err1 = "Veuillez spécifiez ce champ",
  });

  TextEditingController controller = TextEditingController();

  //création du formulaire
  TextFormField textformfield(void ontap(e)) {
    return TextFormField(
      controller: controller,
      onChanged: (e) {
        ontap(e);
      },
      validator: (e) {
        if (e == null || e.isEmpty) {
          return this.err1;
        } else {
          return null;
        }
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
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
      ),
    );
  }

  // création du formulaire du phone
  /*IntlPhoneField intlPhoneField(void ontap(e)) {
    return IntlPhoneField(
      invalidNumberMessage: "Entrer votre Numéro",
      controller: controller,
      onChanged: (e) {
        ontap(e.completeNumber);
      },
      searchText: "Recherche pays",
      initialCountryCode: '',
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
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
      ),
    );
  }*/
}

class Password {
  late String title;
  late String placeholder;
  late String err1;
  late String value;

  Password({
    this.title = "",
    this.placeholder = "",
    this.err1 = "Veuillez spécifiez ce champ",
  });

  TextEditingController controller = TextEditingController();

  TextFormField texform(void ontap(e), bool ispass, void pressMe()) {
    return TextFormField(
        //maxLines: 8,
        controller: controller,
        onChanged: (e) {
          ontap(e);
        },
        validator: (e) {
          Pattern pattern =
              r'^(?=.*?[a-zA-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
          RegExp regex = RegExp(pattern as String);
          if (e == null || e.isEmpty) {
            return err1;
          } /* else if (!regex.hasMatch(e)) {
            return err1;
          } */
          else {
            return null;
          }
        },
        obscureText: !ispass,
        decoration: InputDecoration(
          hintText: this.placeholder,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              ispass ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              pressMe();
            },
            // Update the state i.e. toogle the state of passwordVisible variable
          ),
          labelText: this.title,
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
        ));
  }

  // formulaire url
  TextFormField url(void ontap(e)) {
    return TextFormField(
        controller: controller,
        onChanged: (e) {
          ontap(e);
        },
        validator: (e) {
          Pattern pattern =
              r'^((https?|ftp|file):\/\/)?([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(:[0-9]+)?(\/.*)?$';
          RegExp regex = RegExp(pattern as String);
          if (e == null || e.isEmpty) {
            return err1;
          } else if (!regex.hasMatch(e)) {
            return err1;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: this.placeholder,
          labelText: this.title,
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
        ));
  }

  //formulaire dropdown

}
