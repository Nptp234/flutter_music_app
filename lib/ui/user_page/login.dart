import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/user.dart';
import 'package:flutter_music_app/model/const.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget{

  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  final user = User();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context){
    return Container(
      width: getMainWidth(context),
      height: getMainHeight(context),
      padding: const EdgeInsets.all(10),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _input(context, 'Your email', emailControl),
          _input(context, 'Your password', passwordControl),
          const SizedBox(height: 50,),

          //button
          GestureDetector(
            onTap: () {
              // user.setUser(emailControl.text, )
            },
            child: Container(
              width: getMainWidth(context),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: const Center(child: Text('Sign in', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),),
            ),
          )
        ],
      ),
    );
  }

  Widget _input(BuildContext context, String title, TextEditingController input){
    return Container(
      padding: const EdgeInsets.all(10),
      width: getMainWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.start,),
          TextFormField(
            controller: input,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              fillColor: Colors.grey[100],
              errorBorder: null,
              enabledBorder: null,
              focusedBorder: null,
              disabledBorder: null,
              focusedErrorBorder: null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),
          )
        ],
      ),
    );
  }
  
}