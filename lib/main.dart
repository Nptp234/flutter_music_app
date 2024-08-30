import 'package:flutter/material.dart';
import 'package:flutter_music_app/model/bottom_menu.dart';
import 'package:flutter_music_app/model/temp.dart';
import 'package:flutter_music_app/ui/pages/music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const BottomMenu()
    );
  }
}
