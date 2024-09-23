
import 'package:flutter/material.dart';
import 'package:flutter_music_app/data/model/user.dart';
import 'package:flutter_music_app/model/const.dart';
import 'package:flutter_music_app/model/list_menu_account.dart';
import 'package:flutter_music_app/ui/user_page/user_center.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {

  final user = User();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Center(
          child: user.username!=null?
            AccountMenu():
            Container(
              width: getMainWidth(context)/1.2,
              height: getMainHeight(context)/2.3,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.black38.withOpacity(0.5))
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        //title
                        Text('Oops!', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        SizedBox(height: 20,),
                        //text
                        Text('We can help you login or create your account', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                        
                      ],
                    ),
                    //button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserCenter()));
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Text('Ok', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

}


