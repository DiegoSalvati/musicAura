import 'dart:ui' show Color;

import 'package:flutter/material.dart';

class AppColors extends Object {
  // Brand Colors
  static const Color lightPink = const Color(0xfffceae0);
  static const Color midPink = const Color(0xff8f5d3c1);
  static const Color darkPink = const Color(0xfff49596);
  static const Color lightBlue = const Color(0xffa6dcea);
  static const Color midBlue = const Color(0xff85bce6);
  static const Color Violet = const Color(0xff5a537e);
  static const Color formBackgroundColor = const Color(0xffe7e7e5);
  static const Color FacebookColor = const Color(0xff4267B2);
  static const Color GoogleColor = const Color(0xff3cba54);
}

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));
