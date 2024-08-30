import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/bottom_menu.dart';
import 'package:flutter_music_app/model/const.dart';
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: _body(context),
      ),
      // bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _body(BuildContext context){
    return Container(
      height: getMainHeight(context)-100,
      padding: const EdgeInsets.only(top: 50),
      constraints: const BoxConstraints(maxWidth: 400),
      color: Colors.transparent,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MySearchBar(),

          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: _list.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MusicDetail(music: _list[index])));
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: MusicItem(music: _list[index]),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }



}