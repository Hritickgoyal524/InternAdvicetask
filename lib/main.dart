import 'package:flutter/material.dart';
import 'package:internadvice_task/history.dart';
import 'package:internadvice_task/home.dart';
import 'package:internadvice_task/modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Advice>(
          builder: (_) =>Advice(),
          child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
     initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => Home(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => History(),
  },
  ));
  }
}

