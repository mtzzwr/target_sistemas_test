import 'package:flutter/material.dart';

class Constants {
  static const String privacyPolicyUrl = 'https://www.google.com.br/';
  static showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
