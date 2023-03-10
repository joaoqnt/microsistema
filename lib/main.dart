import 'package:flutter/material.dart';
import 'package:microsistema/view/vwLogin.dart';


void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int telaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: LoginPage()
    );
  }
}

