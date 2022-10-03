import 'package:flutter/material.dart';
import 'package:uberclone/Screens/method.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
        
      ),
      body: Center( 
        child: GestureDetector
      (onTap: (){logout(context);},
      child: Text(" LOGOUT ",
      style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),)));
  }
}