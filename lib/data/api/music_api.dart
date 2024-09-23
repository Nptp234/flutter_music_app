import 'dart:convert';

import 'package:flutter_music_app/data/model/music.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MusicApi{
  final String? key = dotenv.env['AIRTABLE_KEY'];
  final String baseUrl = 'https://api.airtable.com/v0/${dotenv.env['BASE_ID']}/${dotenv.env['MUSIC_ID']}';

  String formatName(String name){
    RegExp regExp = RegExp(r'(.+\.mp3)\s*\(');
    RegExpMatch? match = regExp.firstMatch(name);
    
    if (match != null) {
      String name = match.group(1)!;
      return name;
    } else {
      return "";
    }
  }

  Future<Map<dynamic, dynamic>> _fetchAllData() async{
    try{
      final res = await http.get(Uri.parse(baseUrl), headers: {'Authorization': 'Bearer $key'});
      if(res.statusCode==200){return jsonDecode(res.body);}
      else{return {};}
    }
    catch(e){
      rethrow;
    }
  }

  Future<List<Music>> getList() async{
    try{
      Map<dynamic, dynamic> body = await _fetchAllData();
      if(body=={}) return [];

      var records = body["records"];

      List<Music> lst = [];
      for(var record in records){
        var field = record["fields"];
        lst.add(Music.fromJson(field));
      }
      
      return lst;
    }
    catch(e){
      rethrow;
    }
  }
}