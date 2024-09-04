import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/data/model/playlist.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/list_music.dart';
import 'package:flutter_music_app/model/playlist_item.dart';
import 'package:flutter_music_app/model/search_bar.dart';
import 'package:flutter_music_app/ui/detail/playlist_detail.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  final List<Playlist> _list = [
    Playlist(name: "Melodic rap", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Liked music", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Most like", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "For you", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "My playlist", img: 'assets/logoIcon/arvarta.png'),
    Playlist(name: "Melodic rap", img: 'assets/logoIcon/arvarta.png'),
  ];

  final List<Music> _musics = [
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
  ];

  final List<Music> _lst = [
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
    Music(name: 'Simple Love', uper: 'Obito', imgUrl: 'assets/logoIcon/arvarta.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: Flexible(child: _body(context)),
        ),
      )
    );
  }

  Widget _body(BuildContext context){
    return Container(
      height: getMainHeight(context),
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,

      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          const MySearchBar(),

          //flexible for not overflowed
          ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              _lstPlaylist(context, 'For you', _list),
              _lstPlaylist(context, 'Popular playlist', _list),
              _lstPlaylist(context, 'Lofi', _list),
              _lstPlaylist(context, 'Vietnamese beat', _list),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('List music', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              MusicList(list: _lst)
            ],
          )
        ],
      ),
    );
  }

  Widget _lstPlaylist(BuildContext context, String title, List<Playlist> lst){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          SizedBox(
            height: getMainHeight(context)/3,
            child: GridView.builder(
              itemCount: lst.isEmpty?1:lst.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                crossAxisSpacing: 0,
                childAspectRatio: 0.8
              ),
              itemBuilder: (context, index){
                lst[index].setMusics(_musics);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistDetail(playlist: lst[index],)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: PlaylistItem(playlist: lst[index]),
                  ),
                );
              }, 
            ),
          )
        ]
      ),
    );
  }

}