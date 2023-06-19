import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/RouteGenerator.dart';
import 'Home.dart';
import 'Login.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.collection('usuarios').doc('001')
      .set({'nome': 'Hamze'});


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      primaryColor: Color(0xff075E54),
  ),
  ));
}
