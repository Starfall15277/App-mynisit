import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

import '../presentation/models/task.dart';


class DBHelper{
  static Database? _db;
  static  int _databaseVersion = 1;
  static  String _taleName = "tasks";
  final String _databaseName = "TaskData.db";
  final int _dataVersion = 1;


  final String _createSQL = " CREATE TABLE TaskList ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "title STRING,"
      "note TEXT ,"
      "date STRING, "
      "startTime STRING ,"
      "endTime STRING , "
      "remind INTEGER,"
      "repeat STRING, "
      "color INTEGER, "
      "isCompleted INTEGER)";


  late String createSqlCommand;
  late String databasePath;
  late String dbPath;
  late Database _database;

  void openOrCreateDatabase() async{
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion,onCreate: createDatabase);
  }

  Future<void> createDatabase(Database db, int version) async{
    if(createSqlCommand!=""){
      await db.execute(createSqlCommand);
    }
  }

  Future<List<Map<String,dynamic>>>queryDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion ,onCreate: createDatabase);
    return await _database.rawQuery(sqlString);
  }

  Future<int>insertDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion ,onCreate: createDatabase);
    return await _database.rawInsert(sqlString);
  }


  Future<int>upDateDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion ,onCreate: createDatabase);
    return await _database.rawUpdate(sqlString);
  }

  Future<int>deleteDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion ,onCreate: createDatabase);
    return await _database.rawDelete(sqlString);
  }

  void closeDatabase() async{
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _databaseName);
    _database = await openDatabase(dbPath,
        version: _databaseVersion,onCreate: createDatabase);
    await _database.close();
  }







  static Future<void> initDb()async{
    if(_db != null){
      return;
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _db = await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: (db, version) {
          print("creating a new one");

          return db.execute(
            "CREATE TABLE $_taleName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "title STRING,"
                "note STRING ,"
                "date STRING, "
                "startTime STRING ,"
                "endTime STRING , "
                "remind INTEGER,"
                "repeat STRING, "
                "color INTEGER, "
                "isCompleted INTEGER)",
          );
        },
      );
    } catch (e){
      print(e);
    }
  }

  static Future<int> insert(Task? task) async{
    print("insert function called");
    return await _db?.insert(_taleName, task!.toJson())??1;
  }

  static Future<List<Map<String,dynamic>>> query() async{
    print("query function called");
    return await _db!.query(_taleName);
  }

  static delete(Task task)async{
    return await _db!.delete(_taleName, where: 'id=?',whereArgs: [task.id]);

  }

  static update(int id) async{
    return await _db!.rawUpdate('''
       UPDATE tasks
       SET isCompleted = ?
       WHERE id =?
    ''',[1,id]);
  }
}


