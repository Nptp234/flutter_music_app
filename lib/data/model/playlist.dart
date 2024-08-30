import 'package:flutter_music_app/data/model/music.dart';

class Playlist{
  String? id, name, img;
  List<Music>? musics;
  
  Playlist({this.id, this.name, this.musics, this.img});
  
  void setMusics(List<Music> lst){musics=lst;}

}