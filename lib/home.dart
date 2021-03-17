import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internadvice_task/history.dart';
import 'database.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String advice;
  final DbAdvice dbmanager = new DbAdvice();
  bool load = true;
  Color col = Colors.white;
  insertdata() async {
    int i = await dbmanager.insert({
      "name": advice,
      "time": DateTime.now().toString()

    });
  }

  getAdvice() async {
    String url = "https://api.adviceslip.com/advice";
    var response = await http.get(url);
    print(response);
    var result = jsonDecode(response.body);

    advice = result['slip']['advice'];
    load = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Advice App",
                style: TextStyle(color: Colors.white, fontSize: 22))),
        body: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Text("Want to take an Advice!! then click on that button",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w400))),
          SizedBox(height: 50),
          load == false
              ? Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                      color: col, borderRadius: BorderRadius.circular(27)),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 200,
                  child: Center(
                      child: Text(advice == null ? "" : advice,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)))),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 90),
              child: Row(children: [
                Expanded(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => History()));
                        },
                        color: Colors.blueAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: Text("History",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))),
                SizedBox(width: 20),
                Expanded(
                    child: FlatButton(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  onPressed: () async {
                    setState(() {
                      load = false;
                      col = Colors.red;
                    });

                    getAdvice();
                    await insertdata();
                  },
                  child: Text("Take Advice",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                )),
              ])),
        ]));
  }
}
