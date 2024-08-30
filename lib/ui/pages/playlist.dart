import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/playlist.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/playlist_item.dart';
import 'package:flutter_music_app/model/search_bar.dart';

class PlaylistPage extends StatefulWidget{
  const PlaylistPage({super.key});
 
  @override
  State<PlaylistPage> createState() => _PlaylistPage();
}

class _PlaylistPage extends State<PlaylistPage>{

  final List<Playlist> _list = [
    Playlist(name: "Melodic rap", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Liked music", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Most like", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "For you", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "My playlist", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Melodic rap", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Liked music", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Most like", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "For you", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "My playlist", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Melodic rap", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Liked music", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Most like", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "For you", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "My playlist", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Melodic rap", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Liked music", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Most like", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "For you", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "My playlist", img: 'assets/logoIcon/arvarta.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context){
    return Container(
      height: getMainHeight(context)-100,
      padding: const EdgeInsets.only(top: 50),
      color: Colors.transparent,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MySearchBar(),

          Expanded(
            // flex: 2,
            child: GridView.builder(
              itemCount: _list.isEmpty?1:_list.length,
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                crossAxisSpacing: 0,
                childAspectRatio: 0.8
              ),
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                  child: PlaylistItem(playlist: _list[index]),
                );
              }, 
            ),
          ),
        ],
      ),
    );
  }

}