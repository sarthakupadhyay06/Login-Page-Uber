import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uberclone/Screens/log.dart';
Future<User?> registrationpage(String name,String password,String email,String phone) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
   User user;
  try{
   
    final user=(await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
    if(user!=null){
      Fluttertoast.showToast(msg: "Login Successful");
      return user;
    }
    else{
       Fluttertoast.showToast(msg: "Login failed");
      return user;
    }
  }
  catch(e){
 print(e);
 return null;
  }
}
Future <User?> login(String email,String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  try{
    final user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    if(user!=null){
      Fluttertoast.showToast(msg: "Login Successful");
      return user;
    }
    else{
       Fluttertoast.showToast(msg: "Login failed");
      return user;
    }  
     }catch(e){
        print(e);
        return null;
  }
}
Future logout(context)async{
   FirebaseAuth _auth = FirebaseAuth.instance;
   
   try{
    await _auth.signOut().then((value){
     
      Navigator.push(context, MaterialPageRoute(builder: (_)=>log()));
    });
   }catch(e){
    print("error");
   }
}