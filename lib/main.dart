import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_music_app/model/bottom_menu.dart';
import 'package:flutter_music_app/state_manage/provider/upload_music.dart';
import 'package:provider/provider.dart';

void main() async{
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UploadMusicProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: const BottomMenu()
      ),
    );
  }
}
