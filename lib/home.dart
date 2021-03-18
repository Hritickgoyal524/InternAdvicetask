

import 'package:flutter/material.dart';

import 'package:internadvice_task/history.dart';
import 'package:internadvice_task/modal.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
 

  
  

 

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
          Consumer<Advice>(
 builder:(context,advice,child){
   return advice.load== false
              ? Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                      color: advice.col, borderRadius: BorderRadius.circular(27)),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 200,
                  child: Center(
                      child: Text(advice.advice == null ? "" : advice.advice,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))));
 

   }  )


          ,
       Consumer<Advice>(
 builder:(context,advice,child){
   return   Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 90),
              child: Row(children: [
                Expanded(
                    child: FlatButton(
                        onPressed: () async{
                          await advice.getadvicedata();
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
                  onPressed: ()  {
                    advice.setload();
                    advice.getadvice();
                    
                      advice.setcolor();
                  

                   
                  },
                  child: Text("Take Advice",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                )),
              ]));})
        ]));
  }
}
