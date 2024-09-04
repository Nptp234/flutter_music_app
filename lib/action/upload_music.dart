import 'dart:collection';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class UploadMusic{
  List<File> _files = [];
  UnmodifiableListView<File> get files => UnmodifiableListView(_files);

  Future<List<File>> pickFile() async{
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['mp3'],
      );
      if(result!=null){
        _files = result.paths.map((path)=>File(path!)).toList();
        return _files;
      }
      else{
        return [];
      }
    }
    catch(e){
      rethrow;
    }
  }
}