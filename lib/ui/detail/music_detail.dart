import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/duration_bar.dart';
import 'package:just_audio/just_audio.dart';

class MusicDetail extends StatefulWidget{
  MusicDetail({super.key, required this.music});
  Music music;

  @override
  State<MusicDetail> createState() => _MusicDetail();
}

class _MusicDetail extends State<MusicDetail>{

  final AudioPlayer audioPlayer = AudioPlayer();

  Future<Duration?> _loadUrl() async{
    try {
      Duration? duration = await audioPlayer.setUrl(widget.music.url!);
      return duration!;
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    widget.music.url = 'https://incompetech.com/music/royalty-free/mp3-royaltyfree/Bleeping%20Demo.mp3';
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: _body(context),
    );
  }

  PreferredSize _header(BuildContext context){
    return PreferredSize(
      preferredSize: const Size.fromHeight(50), 
      child: Container(
        width: getMainWidth(context),
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 50),

        decoration: const BoxDecoration(
          color: Colors.transparent
        ),

        child: Row(
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
      )
    );
  }

  Widget _body(BuildContext context){
    return Container(
      width: getMainWidth(context),
      height: getMainHeight(context),
      padding: const EdgeInsets.all(10),

      child: Stack(
        children: [
          //img and blur
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(widget.music.imgUrl!, fit: BoxFit.cover,),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black38.withOpacity(0.6),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),

          //action
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: getMainWidth(context),
              height: getMainHeight(context)/2.5,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  //name, download, playlist
                  _titleMusic(context, false),

                  //duration 
                  _durationBar(),

                  //play, skip
                  _playSkip(context),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _titleMusic(BuildContext context, bool isPlaylist){

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          // name
          SizedBox(
            width: getMainWidth(context)/2.5,
            child: Text(widget.music.name!, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          Row(
            children: [
              // add/remove playlist
              isPlaylist?
              IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle_outline, color: Colors.white, size: 30,)):
              IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.add_circled_solid, color: Colors.white, size: 30,)),
              // download
              IconButton(onPressed: (){}, icon: const Icon(Icons.download_for_offline_rounded, color: Colors.white, size: 30,))
            ],
          )
        ],
      ),
    );
  }

  Widget _durationBar(){
    return FutureBuilder<Duration?>(
      future: _loadUrl(), 
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return DurationBar(audioPlayer: audioPlayer, duration: const Duration(seconds: 0));
        }
        else if(snapshot.data==null){
          return const Center(child: Text('data is null'),);
        }
        else if(snapshot.hasError){
          return Center(child: Text('${snapshot.error}'),);
        }
        else{
          audioPlayer.play();
          return DurationBar(audioPlayer: audioPlayer, duration: snapshot.data!);
        }
      }
    );
  }

  bool isPause = false;

  Widget _playSkip(BuildContext context){
    return Container(
      width: getMainWidth(context),
      margin: const EdgeInsets.only(top: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          //back
          IconButton(
            onPressed: (){}, 
            icon: const Icon(CupertinoIcons.backward_end, color: Colors.white, size: 60,)
          ),

          //pause
          IconButton(
            onPressed: (){
              if(isPause){
                audioPlayer.play();
              }else {audioPlayer.pause();}
              isPause = !isPause;
            }, 
            icon: const Icon(CupertinoIcons.pause_circle, color: Colors.white, size: 60,)
          ),

          //next
          IconButton(
            onPressed: (){}, 
            icon: const Icon(CupertinoIcons.forward_end, color: Colors.white, size: 60,)
          ),
        ],
      ),
    );
  }

}