import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/user.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/ui/user_page/create_user.dart';
import 'package:flutter_music_app/ui/user_page/login.dart';

class UserCenter extends StatelessWidget{

  final user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return Container(
      width: getMainWidth(context),
      height: getMainHeight(context),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.black
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          //logo
          SizedBox(
            width: 150,
            child: Image.asset('assets/logoIcon/logo_music.png', fit: BoxFit.cover,),
          ),
          //button
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //title
                const Text('Lets listen music together!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                
                _button(context, (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));}, Colors.green, 'Lets create your account', false),
                _button(context, (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));}, Colors.black, 'Sign In', true),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _button(BuildContext context, GestureTapCallback action, Color color, String text, bool isSignIn){
    return GestureDetector(
                onTap: action,
                child: Container(
                  width: getMainWidth(context),
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: isSignIn?Colors.grey:Colors.green)
                  ),
                  child: isSignIn?
                    Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),):
                    Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                ),
              );
  }

}