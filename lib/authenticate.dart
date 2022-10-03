import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uberclone/Screens/log.dart';
import 'package:uberclone/homepage.dart';

class authenticate extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(auth.currentUser!=null){
      return homepage();
    }else{
      return log();
    }
    
  }
}