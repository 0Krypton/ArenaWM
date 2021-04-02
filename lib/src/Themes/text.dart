//importing packages
import 'package:flutter/material.dart';

//Reglo FontFamily
Text reglo(
    {required String text,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'Reglo',
    ),
  );
}

///////////////////////////////////////////////////////////

//SfPro FontFamily
Text sfPro(
    {required String text,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'SfPro',
    ),
  );
}

///////////////////////////////////////////////////////////

//PtSans FontFamily
Text ptSans(
    {required String text,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'PtSans',
    ),
  );
}

///////////////////////////////////////////////////////////

//Aremat FontFamily
Text aremat(
    {required String text,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'Aremat',
    ),
  );
}
///////////////////////////////////////////////////////////

//Bronx FontFamily
Text bronx(
    {required String text,
    required double fontSize,
    required Color color,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'Bronx',
    ),
  );
}
///////////////////////////////////////////////////////////

//Gilroy FontFamily
Text gilroy({
  required String text,
  required double fontSize,
  required Color color,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'Gilroy',
    ),
  );
}

//Qanelas FontFamily
Text qanelas({
  required String text,
  double? fontSize = 12,
  required Color color,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? null,
      fontFamily: 'Qanelas',
    ),
  );
}
