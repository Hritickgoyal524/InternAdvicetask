import 'package:flutter/material.dart';

import 'database.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  List<Map<String, dynamic>> query = [];
  final DbAdvice dbmanager = new DbAdvice();
  bool load = false;
  getdata() async {
    query = await dbmanager.getadvice();
    load = true;
    setState(() {});
  }

  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("History Page",
              style: TextStyle(color: Colors.white, fontSize: 22)),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
              child: Text("Below is the List of all the advices taken yet!!!!",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 40),
            load == null
                ? CircularProgressIndicator()
                : ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: query.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(25)),
                          height: 150,
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Text(
                                  query[index]['name'] == null
                                      ? ""
                                      : query[index]['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      query[index]['time'],
                                      style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    )))
                          ]));
                    })
          ],
        )));
  }
}
