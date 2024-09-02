import 'package:flutter_music_app/data/local_store/main_store.dart';

class FavoriteSqlite{
  final _sqLiteService = SQLiteService();

  Future<bool> insert(String id) async{
    try{
      final db = await _sqLiteService.database;
      var data = await db.rawQuery('insert into favorite(id) values ($id)');
      return data!=[];
    }
    catch(e){
      rethrow;
    }
  }

  Future<void> remove(String id) async{
    try{
      final db = await _sqLiteService.database;
      await db.rawQuery('delete from favorite where id=$id');
    }
    catch(e){
      rethrow;
    }
  }
}