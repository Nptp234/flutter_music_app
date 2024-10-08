import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';

class UploadMusicProvider with ChangeNotifier{
  List<File> _lst = [];
  UnmodifiableListView<File> get lst => UnmodifiableListView(_lst);

  void addMusic(File music){
    _lst.add(music);
    notifyListeners();
  }

  void setList(List<File> files){
    _lst = files;
    notifyListeners();
  }
}