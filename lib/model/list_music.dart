import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/music_item.dart';
import 'package:flutter_music_app/ui/detail/music_detail.dart';

class MusicList extends StatelessWidget{
  
  List<Music> list;
  MusicList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MusicDetail(music: list[index])));
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: MusicItem(music: list[index]),
                  ),
                );
              }
            );
  }

}