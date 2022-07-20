import 'dart:ui';

import 'package:flutter/material.dart';

class UiUtils{
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}