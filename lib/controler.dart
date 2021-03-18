import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internadvice_task/database.dart';

class Controller{
    final DbAdvice dbmanager = new DbAdvice();
  insertdata(String advice) async {
    int i = await dbmanager.insert({
      "name": advice,
      "time": DateTime.now().toString()

    });
   
  }
  Future<String> getAdvice() async {
   String advice;
    String url = "https://api.adviceslip.com/advice";
    var response = await http.get(url);
   
    var result = jsonDecode(response.body);

   return advice = result['slip']['advice'];
    
    
  }
  getdata() async {
 var query = await dbmanager.getadvice();
    return query;
    
  }
}