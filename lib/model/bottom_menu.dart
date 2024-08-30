import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/ui/pages/account.dart';
import 'package:flutter_music_app/ui/pages/music.dart';
import 'package:flutter_music_app/ui/pages/playlist.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BottomMenu extends StatefulWidget{
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenu();
}

class _BottomMenu extends State<BottomMenu> with TickerProviderStateMixin{
  
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3, 
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _motionTabBarController!.index,
        children: const [
          MusicPage(),
          PlaylistPage(),
          AccountPage(),
        ],
      ),

      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabIconColor: Colors.grey,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabSize: 50,
        tabBarHeight: 60,
        tabBarColor: Colors.black,
        textStyle: const TextStyle(color: Colors.transparent),

        initialSelectedTab: "Music", 
        labels: const ["Music", "Playlist", "Account"],
        icons: const [Icons.music_note, CupertinoIcons.list_dash, Icons.person],

        onTabItemSelected: (int value) {
            setState(() {
              _motionTabBarController!.index = value;
            });
          },
      ),
    );
  }

}