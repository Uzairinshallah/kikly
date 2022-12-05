
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Functions {

   String mapKey =  "AIzaSyBfWTD74iNs4oZIUkRDYxVktSOGe0p4KN8";

  static handleError(String error, BuildContext context) {
    switch (error) {
      case "[firebase_auth/email-already-in-use] Die E-Mail-Adresse wird bereits von einem anderen Konto verwendet.":
        Functions.showSnackBar(context, 'E-Mail wird bereits verwendet');
        Navigator.pop(context);
        break;
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        Functions.showSnackBar(context, 'E-Mail wird bereits verwendet');
        Navigator.pop(context);
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        Navigator.pop(context);
        Functions.showSnackBar(context, 'Das Passwort ist falsch');
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
      // return "No user found with this email.";
        break;
    }
  }


  static showSnackBar(BuildContext context, String message, {Color? color}) {
    color ??= CColors.pinkText;
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static BoxDecoration shadowDecoration({
    double radius = 0,
    Color color = Colors.white,
    Border? border,
  }) {
    return BoxDecoration(
      color: color,
      border: border,
      boxShadow: [
        BoxShadow(
          color: CColors.pinkText.withOpacity(0.18),
          spreadRadius: 0,
          blurRadius: 14,
          offset: const Offset(0, 2.0),
        ),
      ],
      borderRadius: BorderRadius.circular(radius),
    );
  }}





