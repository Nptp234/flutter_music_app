import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/api/music_api.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/menu_bottom_sheet.dart';

class MusicItem extends StatelessWidget{

  final Music music;
  MusicItem({super.key, required this.music});

  MusicApi musicApi = MusicApi();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          //image
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              width: 70,
              height: 70,
              child: Image.network(music.imgUrl!, fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 15,),

          //name $ des
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(music.name!, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                const SizedBox(height: 7,),
                Text(music.uper!, style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),)
              ],
            ),
          ),

          //menu button
          IconButton(
            onPressed: (){
              customBottomSheet(context, music);
            }, 
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 20,)
          ),
        ],
      ),
    );
  }

}