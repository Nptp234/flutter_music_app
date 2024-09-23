import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/api/music_api.dart';
import 'package:flutter_music_app/data/model/music.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/duration_bar.dart';
import 'package:flutter_music_app/model/menu_bottom_sheet.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MusicDetail extends StatefulWidget{
  MusicDetail({super.key, required this.music});
  Music music;

  @override
  State<MusicDetail> createState() => _MusicDetail();
}

class _MusicDetail extends State<MusicDetail>{

  AudioPlayer audioPlayer = AudioPlayer();
  MusicApi musicApi = MusicApi();
  late final StreamSubscription<Duration> positionSubscription;
  Duration? duration;
  bool _alertShown = false;

  Future<Duration?> _loadUrl() async{
    try {
      duration = await audioPlayer.setUrl(widget.music.url!);
      return duration!;
    } catch (e) {
      return null;
    }
  }

  Duration _currentDurration = Duration(seconds: 0);
  Timer? _timer;

  void _startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 1), (_){
      _currentDurration = audioPlayer.position;
    });
  }
  void _stopTimer(){_timer!.cancel();}

  void _check(){
    if(duration!.inSeconds>0 && !_alertShown){
      double percentagePlayed = _currentDurration.inSeconds / duration!.inSeconds;

      // Check if the percentage played is at least 50%
      if (percentagePlayed >= 0.5) {
        _alertShown=true;
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          text: "Player has played 50% or more of: ${widget.music.name}",
        );
      }
    }
  }

  @override
  void initState() {
    // widget.music.url = 'https://incompetech.com/music/royalty-free/mp3-royaltyfree/Bleeping%20Demo.mp3';
    audioPlayer.positionStream.listen((position) {
      _check();
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _stopTimer();
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
              onPressed: (){customBottomSheet(context, widget.music);}, 
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
              child: Image.network(widget.music.imgUrl!, fit: BoxFit.cover,),
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
            width: getMainWidth(context)/1.75,
            child: Text(widget.music.name!, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), maxLines: 3, textAlign: TextAlign.left,),
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
          _startTimer();
          return DurationBar(audioPlayer: audioPlayer, duration: snapshot.data!);
        }
      }
    );
  }

  bool isPause = false;
  IconData icon = CupertinoIcons.pause_circle;

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
          Center(child: Pause(isPause: isPause, audioPlayer: audioPlayer),),

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

class Pause extends StatefulWidget{
  
  bool isPause;
  AudioPlayer audioPlayer;
  Pause({super.key, required this.isPause, required this.audioPlayer});

  @override
  State<Pause> createState() => _Pause();
}
class _Pause extends State<Pause>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
            onPressed: (){
              if(widget.isPause){
                widget.audioPlayer.play();
              }else {
                widget.audioPlayer.pause();
              }
              setState(() {
                widget.isPause = !widget.isPause;
              });
            }, 
            icon: !widget.isPause?const Icon(CupertinoIcons.pause_circle, color: Colors.white, size: 60,):const Icon(CupertinoIcons.play_circle, color: Colors.white, size: 60,)
          ),
    );
  }

}