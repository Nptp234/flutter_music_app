import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/model/const.dart';

class MySearchBar extends StatelessWidget{
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMainWidth(context),
      height: 50,
      padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search, size: 20, color: Colors.white,),
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.list_dash, size: 20, color: Colors.white,)),
                hintText: 'Search...',
                hintStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                labelStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                errorBorder: null,
                enabledBorder: null,
                focusedBorder: null,
                disabledBorder: null,
                border: InputBorder.none,
              ),
            )
          )

        ],
      ),
    );
  }

}