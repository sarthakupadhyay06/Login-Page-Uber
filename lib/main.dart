import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uberclone/Screens/log.dart';
import 'package:uberclone/authenticate.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
DatabaseReference UserRef = FirebaseDatabase.instance.ref().child("users");
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UBERCLONE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authenticate(),
    );
  }
}

