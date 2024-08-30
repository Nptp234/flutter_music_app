// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DurationBar extends StatefulWidget{
  const DurationBar({super.key, required this.audioPlayer, required this.duration});

  final AudioPlayer audioPlayer;
  final Duration duration;

  @override
  State<DurationBar> createState() => _DurationBar();
}

class _DurationBar extends State<DurationBar>{

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: widget.audioPlayer.positionStream, 
      builder: (context, snapshot) { 
        final position = widget.audioPlayer.position;
        final total = widget.duration;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Slider(
              activeColor: Colors.white,
              min: 0,
              max: total.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(), 
              onChanged: (value){
                widget.audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(formatDuration(position)),
                Text(formatDuration(widget.duration)),
              ],
            )
          ],
        );
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

}