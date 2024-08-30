import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/playlist.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/list_music.dart';
import 'package:flutter_music_app/model/search_bar.dart';

class PlaylistDetail extends StatefulWidget{
  PlaylistDetail({super.key, required this.playlist});
  Playlist playlist;

  @override
  State<PlaylistDetail> createState() => _PlaylistDetail();
}

class _PlaylistDetail extends State<PlaylistDetail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: _body(context),
      ),
    );
  }

  PreferredSize _header(BuildContext context){
    return PreferredSize(
      preferredSize: const Size.fromHeight(150), 
      child: Container(
        width: getMainWidth(context),
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 50),

        decoration: const BoxDecoration(
          color: Colors.transparent
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                IconButton(
                  onPressed: (){Navigator.pop(context);}, 
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,)
                ),

                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.more_vert, color: Colors.white, size: 20,)
                ),
              ],
            ),

            const MySearchBar(),
          ],
        )
      )
    );
  }

  Widget _body(BuildContext context){
    return Container(
      width: getMainWidth(context),
      height: getMainHeight(context),
      padding: const EdgeInsets.all(10),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          //img
          Container(
            width: getMainWidth(context)/1.3,
            height: getMainHeight(context)/2.7,
            margin: const EdgeInsets.only(bottom: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.playlist.img!, fit: BoxFit.cover,),
            )
          ),
          //action
          _action(context),
          //list music
          Expanded(
            // flex: 3,
            child: MusicList(list: widget.playlist.musics!,),
          ),
        ],
      ),
    );
  }

  Widget _action(BuildContext context){
    return Container(
      width: getMainWidth(context),
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(CupertinoIcons.add_circled, color: Colors.white, size: 30,)
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(CupertinoIcons.download_circle, color: Colors.white, size: 30,)
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.share, color: Colors.white, size: 30,)
              ),
            ],
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green
              ),
              child: const Center(
                child: Icon(CupertinoIcons.play_fill, color: Colors.white, size: 20,),
              ),
            ),
          )
        ],
      ),
    );
  }
}