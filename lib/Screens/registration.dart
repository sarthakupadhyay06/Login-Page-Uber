import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uberclone/Screens/method.dart';
import 'package:uberclone/homepage.dart';
class registration extends StatefulWidget {
  registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:Colors.white,
          body: isloading?Center(
            child: Container(
              height:10,
              width: 10,
              child: CircularProgressIndicator(),
            ),
          ):
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(height: 70,),
                Image.asset("images/uber.png",height: 150,width: 300,),
                SizedBox(height: 10,),
                Text("Register as a Rider",style: TextStyle(color: Colors.black,fontSize: 20 )),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(controller: nameTextEditingController,keyboardType: TextInputType.name,decoration: InputDecoration(labelText: 'Name',labelStyle: TextStyle(fontSize: 14.0,color: Colors.black),hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0)),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(controller: emailTextEditingController,keyboardType: TextInputType.emailAddress,decoration: InputDecoration(labelText: 'Email',hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0)),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(controller: phoneTextEditingController ,keyboardType: TextInputType.phone,decoration: InputDecoration(labelText: 'Phone',hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0)),),
                    ),
                     Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(controller: passwordTextEditingController,decoration: InputDecoration(labelText: 'Password',hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0)),),
                    ),
                  ],),
                ),
                ElevatedButton(child:Text("Create Account",style: TextStyle(color: Colors.white)) ,onPressed:(){
                    if(nameTextEditingController.text.length<4){
                      Fluttertoast.showToast(msg: "NAME SHOULD BE GREATER THAN 4 CHARACTER");
                    }
                    else if(phoneTextEditingController.text.length!=10){
                         Fluttertoast.showToast(msg: "PHONE NUMBER SHOULD BE 10 NUMBERS");
                    }
                    else if(!emailTextEditingController.text.contains("@")){
                         Fluttertoast.showToast(msg: "PLEASE WRITE A VALID EMAIL ADDRESS");
                    }
                    else if(passwordTextEditingController.text.length<8){
                         Fluttertoast.showToast(msg: "PASSWORD SHOULD BE GREATER THAN 8 WORDS");
                    }
                    else{
                      setState(() {
                        isloading=true;
                      });
                      registrationpage(nameTextEditingController.text, passwordTextEditingController.text, 
                      emailTextEditingController.text, phoneTextEditingController.text).then((user){
                          if(user!=null ){
                            setState(() {
                              isloading=false;
                            });
                            Fluttertoast.showToast(msg: "ACCOUNT CREATE SUCCESSFULL");
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>homepage()));
                          }
                          else{
                              Fluttertoast.showToast(msg: "login failed try again");
                            setState(() {
                              isloading=false;
                            });
                          }
                      } );
                    }
                } ,
                style: ElevatedButton.styleFrom
                (
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                  
                ),primary: Colors.black)),
                SizedBox(height: 20,),
                GestureDetector(child: Text("I already have An Account!..Login Here",style: TextStyle(color: Colors.black),)
                ,onTap: (){Navigator.pop(context);}),
              ]),
            ),
          ),
    );
  }
}