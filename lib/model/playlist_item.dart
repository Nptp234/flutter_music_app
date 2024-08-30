import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/playlist.dart';
import 'package:flutter_music_app/model/const.dart';

class PlaylistItem extends StatelessWidget{

  PlaylistItem({super.key, required this.playlist});
  Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMainWidth(context)/2,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black45.withOpacity(0.5))
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(playlist.img!, fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 10,
              left: 5,
              child: Container(
                color: Colors.black26.withOpacity(0.5),
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Text(playlist.name!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
              )
            )
          ],
        ),
      ),
    );
  }

}