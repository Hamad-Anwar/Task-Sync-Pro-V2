import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/task_model.dart';
class DbHelper
{
  Database? _db;
  Future<Database?> get db
  async {
    if(_db!=null)
    {
      return _db;
    }
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    String path=join(directory!.path,'db');
    var db=await openDatabase(path,version: 1,onCreate: (db, version) {
      db.execute("CREATE TABLE Tasks(key TEXT PRIMARY KEY,title TEXT,category TEXT,description TEXT,image TEXT,date TEXT,startTime TEXT,periority TEXT,show TEXT,endTime TEXT,status,TEXT)");


    },);
    return db;
  }



  Future<TaskModel> insert(TaskModel model) async {
    var dbClient=await db;
    dbClient!.insert('Tasks', model.toMap()).then((value) {
    });
    return model;
  }
  Future<int> delete (String id,String table) async {
    var dbClient=await db;
    return await dbClient!.delete(
        table,
        where: 'key = ?',
        whereArgs: [id]);
  }
  Future<List<TaskModel>> getData() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult = await dbClient!.query('Tasks');
    return queryResult.map((e) => TaskModel.fromMap(e)).toList();
  }


}