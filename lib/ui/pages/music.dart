import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/bottom_menu.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/list_music.dart';
import 'package:flutter_music_app/model/music_item.dart';
import 'package:flutter_music_app/model/search_bar.dart';
import 'package:flutter_music_app/ui/detail/music_detail.dart';

class MusicPage extends StatefulWidget{
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPage();
}

class _MusicPage extends State<MusicPage>{
  
  final List<Music> _list = [
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
          child: _body(context),
        ),
      )
      // bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _body(BuildContext context){
    return Container(
      height: getMainHeight(context),
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MySearchBar(),

          Expanded(
            flex: 3,
            child: MusicList(list: _list)
          ),
        ],
      ),
    );
  }



}