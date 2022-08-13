import 'dart:developer';

import 'package:mynote/Model/notes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DbHelper{
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  Database? database;
  static const String tableName = 'notes';
  static const String noteIdColumName = 'id';
  static const String noteTitleColumName = 'noteTitle';
  static const String noteDescriptionColumName = 'noteDescription';
  static const String noteHoursColumName = 'noteHours';
  static const String noteDayColumName = 'noteDay';
  static const String noteMounthColumName = 'noteMounth';

  static const String noteIsLikeColumName = 'noteIsLike';

  initDatabase()async{
    database = await createConnectionWithDatabase();
  }
  Future<Database> createConnectionWithDatabase() async {
    String dataBaseBath = await getDatabasesPath();
    String dataBaseName = 'notesDate.db';
    String fullBath = join(dataBaseBath,dataBaseName);
    Database database = await openDatabase(fullBath,version: 1,onCreate: (db,i){
      log("Hello,the Database has been created");
      db.execute('''
 CREATE TABLE $tableName (
  $noteIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
   $noteTitleColumName TEXT,
      $noteDescriptionColumName TEXT,
        $noteHoursColumName TEXT,
         $noteDayColumName TEXT,
          $noteMounthColumName TEXT,
           $noteIsLikeColumName INTEGER)
''');}

,onOpen: (db)async{
    log("Hello,the Database has been opened");
    final tables = await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
    log(tables.toString());
    }
    );
    return database;
  }


  insertNewNote(NotesModel notesModel)async{
   await database!.insert(tableName, notesModel.toMap());
  }

  Future<List<NotesModel>>selectAllNotes()async{
    List<Map<String,Object?>> rawsAsMaps = await database!.query(tableName);
    List<NotesModel> tasks = rawsAsMaps.map((e) => NotesModel.fromMap(e)).toList();
    return tasks;
  }

  selectOneNote(int id){
    database!.query(tableName,
    where: '$noteIdColumName=?',
    whereArgs: [id]
    );
  }

  updateLikeNote(NotesModel notesModel){
    notesModel.isLike =! notesModel.isLike!;
    database!.update(tableName,
        notesModel.toMap(),
        where: '$noteIdColumName=?',
        whereArgs: [notesModel.id]);
  }

  updateOneNote(NotesModel notesModel){
    database!.update(tableName,
        notesModel.toMap(),
        where: '$noteIdColumName=?',
        whereArgs: [notesModel.id]);
  }

  deleteOneNote(int id) async{

    await database!.delete(
        tableName
    ,where: '$noteIdColumName=?'
    ,whereArgs: [id]
    );
  }







}