
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbAdvice {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "advice1.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(         
           "CREATE TABLE Advice(id INTEGER PRIMARY KEY autoincrement, name TEXT, time TEXT)",
           
            );
      } );
    }
  }

  Future<int> insert(Map<String,String> row) async {
    await openDb();
    return await _database.insert('Advice', row);
  }

  Future<List<Map<String,dynamic>>> getadvice() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('Advice');
    return maps;
  }

  
}


