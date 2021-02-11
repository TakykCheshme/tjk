import 'package:flutter/material.dart';

const String UPLOAD_URL = "https://tjk.com.tm/upload";
const String IMAGE_URL = "https://tjk.com.tm/img/p";

const TextStyle titleTS = TextStyle(fontSize: 20.0);
const TextStyle title28TS = TextStyle(fontSize: 28.0);
const TextStyle subtitleTS = TextStyle(fontSize: 18.0, color: Colors.grey);

String getCoverById(String id) {
  if (id == null) return "";
  String cover = "";
  for (int i = 0; i < id.length; i++) cover = cover + "/" + id[i];
  return IMAGE_URL + cover + "/" + id + ".jpg";
}

String dashSlashRemover(String s) {
  return s.replaceAll(RegExp(r'-'), ' ').replaceAll(RegExp(r'/'), ' ');
}

const MaterialColor primaryColor = const MaterialColor(
  0xff346D95,
  const <int, Color>{
    50: const Color(0xff346D95),
    100: const Color(0xff346D95),
    200: const Color(0xff346D95),
    300: const Color(0xff346D95),
    400: const Color(0xff346D95),
    500: const Color(0xff346D95),
    600: const Color(0xff346D95),
    700: const Color(0xff346D95),
    800: const Color(0xff346D95),
    900: const Color(0xff346D95),
  },
);
