import 'package:flutter/material.dart';

const String UPLOAD_URL = "https://tjk.com.tm/presta/upload";
const String IMAGE_URL = "https://tjk.com.tm/presta/img/p";

const TextStyle titleTS = TextStyle(fontSize: 20.0);
const TextStyle title28TS = TextStyle(fontSize: 28.0);
const TextStyle subtitleTS = TextStyle(fontSize: 18.0, color: Colors.grey);

String getCoverById(String id) {
  String cover = "";
  for (int i = 0; i < id.length; i++) cover = cover + "/" + id[i];
  return IMAGE_URL + cover + "/" + id + ".jpg";
}

String dashSlashRemover(String s) {
  return s.replaceAll(RegExp(r'-'), ' ').replaceAll(RegExp(r'/'), ' ');
}

Color primaryColor = Color(0xff346D95);
