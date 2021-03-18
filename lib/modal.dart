import 'package:flutter/widgets.dart';
import 'package:internadvice_task/controler.dart';
import 'package:flutter/material.dart';
class Advice extends ChangeNotifier{

  bool  load=true;
  String advice="";
  Color col=Colors.white;
  var data;
  setload(){
    load=false;
  }
  setcolor(){
    col=Colors.red;
    notifyListeners();
  }
  getadvice()async{
    advice=await Controller().getAdvice();
    
   await Controller().insertdata(advice);
   load=true;
    notifyListeners();

  }
  getadvicedata()async{
    data=await Controller().getdata();
 

  }

}