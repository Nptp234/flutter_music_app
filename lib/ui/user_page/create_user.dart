import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/user.dart';
import 'package:flutter_music_app/model/bottom_menu.dart';
import 'package:flutter_music_app/model/const.dart';

class SignUp extends StatelessWidget{

  TextEditingController emailControl = TextEditingController();
  TextEditingController usernameControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  SignUp({super.key});

  final users = ListUserModel();
  final user = User();

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
          _input(context, 'Your username', usernameControl),
          _input(context, 'Your password', passwordControl),
          const SizedBox(height: 50,),

          //button
          GestureDetector(
            onTap: () {
              user.setUser(emailControl.text, usernameControl.text, passwordControl.text);
              users.add(user);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomMenu()));
            },
            child: Container(
              width: getMainWidth(context),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: const Center(child: Text('Sign up', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),),
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