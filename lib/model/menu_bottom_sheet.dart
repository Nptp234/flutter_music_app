import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/const.dart';

customBottomSheet(BuildContext context, Music music){
  return showModalBottomSheet(
                  context: context,
                  builder: (context){
                    return SafeArea(
                      child: Container(
                              height: getMainHeight(context)/2,
                              width: getMainWidth(context),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  _customMusicTitle(context, music),
                                  _customListTitle(context, CupertinoIcons.heart, 'Like', (){}),
                                  _customListTitle(context, CupertinoIcons.music_note_list, 'Add to playlist', (){}),
                                  _customListTitle(context, CupertinoIcons.text_badge_minus, 'Hide this music', (){}),
                                ],
                              ),
                      ),
                    );
                  }
                );
}

Widget _customMusicTitle(BuildContext context, Music music){
    return Container( 
      width: getMainWidth(context),
      height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(music.imgUrl!, fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(music.name!, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
              Text(music.uper!, style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),  
    );
  }

  Widget _customListTitle(BuildContext context, IconData icon, String title, GestureTapCallback action){
    return GestureDetector(
      onTap: action,
      child: Container(
        width: getMainWidth(context),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.white,),
            const SizedBox(width: 20,),
            Expanded(
              flex: 2,
              child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)
            ),
          ],
        ),
      ),
    );
  }