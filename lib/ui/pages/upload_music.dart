import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/action/upload_music.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/state_manage/provider/upload_music.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

class UploadPage extends StatefulWidget{
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPage();
}

class _UploadPage extends State<UploadPage>{

  UploadMusic uploadMusic = UploadMusic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body(context)),
    ); 
  }

  Widget _body(BuildContext context){
    return SizedBox(
      height: getMainHeight(context),
      width: getMainWidth(context),
      child: Consumer<UploadMusicProvider>(
        builder: (context, value, child) {
          return Center(
            child: value.lst.isEmpty?
            _upload(context):
            _listMusic(context)
          );
        },
      )
    );
  }

  Widget _upload(BuildContext context){
    return Consumer<UploadMusicProvider>(
      builder: (context, value, index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getMainWidth(context)-100,
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset('assets/logoIcon/upload-removebg-preview.png', fit: BoxFit.cover,),
            ),
            GestureDetector(
              onTap: () async{
                List<File> files = await uploadMusic.pickFile();
                if(files.isNotEmpty){
                  value.setList(files);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Colors.white, offset: Offset(0, 0), blurRadius: 15)
                  ]
                ),
                child: const Text('Upload Your Music', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        );
      }
    );
  }

  Widget _listMusic(BuildContext context){
    return Consumer<UploadMusicProvider>(
      builder: (context, value, child){
        return Container(
          width: getMainWidth(context),
          height: getMainHeight(context),
          padding: const EdgeInsets.all(10),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //button
              GestureDetector(
                onTap: () async{  
                  List<File> files = await uploadMusic.pickFile();
                  if(files.isNotEmpty){
                    for(var file in files){
                      value.addMusic(file);
                    }
                  }
                },  
                child: Container(
                  width: getMainWidth(context)/2,
                  // height: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Add more', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                      Icon(CupertinoIcons.add, size: 30, color: Colors.black,)
                    ],
                  ),
                ),
              ),
              //list
              const Text('Upload list', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 20,),
              ListView.builder(
                itemCount: value.lst.isNotEmpty?value.lst.length:1,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return _fileItem(context, index+1, path.basename(value.lst[index].path), '${File(value.lst[index].path).lengthSync()}');
                }
              ),
            ],
          )
        );
      }
    );
  }

  Widget _fileItem(BuildContext context, int index, String name, String size){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Audio $index: ', style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
          const SizedBox(width: 10,),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                //path
                Text('Sized: ${double.parse(size).readableFileSize()}', style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),),
              ],
            )
          ),
        ],
      ),
    );
  }
}