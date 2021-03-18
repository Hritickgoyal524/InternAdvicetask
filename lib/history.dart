import 'package:flutter/material.dart';
import 'package:internadvice_task/modal.dart';
import 'package:provider/provider.dart';



class History extends StatelessWidget {

 

  
 
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
             Consumer<Advice>(
 builder:(context,advice,child){
   return  ListView.builder(
                  reverse: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: advice.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(25)),
                          height: 170,
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Text(
                                advice.data[index]['name'],
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
                                      advice.data[index]['time'],
                                      style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    )))
                          ]));
                    });
 })
          ],
        )));
  }
}
