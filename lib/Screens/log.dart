import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uberclone/Screens/method.dart';
import 'package:uberclone/Screens/registration.dart';
import 'package:uberclone/homepage.dart';

class log extends StatefulWidget {
  log({Key? key}) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
          backgroundColor:Colors.white,
          body: 
          isloading?Center(
            child: Container(
              height:10,
              width: 10,
              child: CircularProgressIndicator(),
            ),
          ):SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(height: 105,),
                Image.asset("images/uber.png",height: 200,width: 350,),
                SizedBox(height: 10,),
                Text("Login as a Rider",style: TextStyle(color: Colors.black,fontSize: 20 )),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller:email ,
                        keyboardType: TextInputType.emailAddress,decoration: InputDecoration(labelText: 'Email',hintText: 'Email'),),
                    ),
                     Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                         controller:password ,
                         decoration: InputDecoration(labelText: 'Password',hintText: 'Password'),),
                    ),
                  ],),
                ),
                ElevatedButton(child:Text("Login",style: TextStyle(color: Colors.white)) ,
                onPressed:(){
                       if(!email.text.contains("@")){
                         Fluttertoast.showToast(msg: "PLEASE WRITE A VALID EMAIL ADDRESS");
                    }
                    else if(password.text.length<8){
                         Fluttertoast.showToast(msg: "PASSWORD SHOULD BE GREATER THAN 8 WORDS");
                    }
                    else{
                      setState(() {
                        isloading=true;
                      });
                      login(email.text, password.text).then((user){
                        if(user!=null){
                          setState(() {
                            isloading=false;
                          });
                          Fluttertoast.showToast(msg: "LOGIN SUCCESSFUL");
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => homepage())));
                        }
                        else{Fluttertoast.showToast(msg: "LOGIN Failed try again");}
                      });
                    }
                },
                style: ElevatedButton.styleFrom
                (
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                  
                ),primary: Colors.black)),
                SizedBox(height: 20,),
                GestureDetector(child: Text("Don't have any account? Register Here!.",style: TextStyle(color: Colors.black),)
                ,onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: ((context) => registration())));}),
              ]),
            ),
          ),
    );
  }
}