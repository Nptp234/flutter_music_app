import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:intl/intl.dart';

double getMainHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getMainWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

// usage
// int myInt = 12345678;
// double myDouble = 2546;
// print('myInt: ${myInt.readableFileSize(base1024: false)}');
// print('myDouble: ${myDouble.readableFileSize()}');
extension FileFormatter on num {
  String readableFileSize({bool base1024 = true}) {
    final base = base1024 ? 1024 : 1000;
    if (this <= 0) return "0";
    final units = ["B", "KB", "MB", "GB", "TB"];
    int digitGroups = (log(this) / log(base)).round();
    return "${NumberFormat("#,##0.#").format(this / pow(base, digitGroups))} ${units[digitGroups]}";
  }
}