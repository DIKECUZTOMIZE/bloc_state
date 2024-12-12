import 'dart:io';

import 'package:block/data_base_modify/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  DbHelper._();
  static DbHelper getInstance() =>DbHelper._();

  Database? mDataD;

  static const NOTE_TABLE = 'n_table';
  static const NOTE_COLUMN_ID = 'n_id';
  static const NOTE_COLUMN_TITLE = 'n_title';
  static const NOTE_COLUMN_DESC = 'n_desc';

  Future<Database> initDB()async{
    mDataD = mDataD ?? await openDB();
    return mDataD!;
  }

  Future<Database> openDB()async{
    Directory dirPath = await getApplicationDocumentsDirectory();
    String dbPath = join(dirPath.path, 'noteDB.db');

    return openDatabase(dbPath,version: 1,onCreate: (db, version) {
      db.execute('create table $NOTE_TABLE ( $NOTE_COLUMN_ID integer primary key autoIncrement, $NOTE_COLUMN_TITLE text, $NOTE_COLUMN_DESC text)');
    },);
  }

  Future<bool>addNote(NoteModel addNote)async{
    Database db = await initDB();
    int rowsEffected = await db.insert(NOTE_TABLE,addNote.toMap());
    return rowsEffected >0;
  }
  Future<List<NoteModel>>fectsNote()async{
    Database db = await initDB();
    List<Map<String,dynamic>> allNote = await db.query(NOTE_TABLE);

    List<NoteModel> newNotes =[];
    for(Map<String ,dynamic> eachData in allNote){
      NoteModel eachNotes = NoteModel.fromMap(eachData);
      newNotes.add(eachNotes);
    }
    return newNotes;
  }

  Future<bool>updateNotes(NoteModel updateNotes)async{
 // Future<bool>updateNotes({required String titleUD ,required String  descUD,required int updateIdD })async{
    Database db = await initDB();

    int rowsEffected = await db.update(NOTE_TABLE, updateNotes.toMap());

    // int rowsEffected = await db.update(NOTE_TABLE, {
    //   NOTE_COLUMN_TITLE : titleUD,
    //   NOTE_COLUMN_DESC:  descUD
    // }, where: '$NOTE_COLUMN_ID =?', whereArgs: ['$updateIdD']);
    return rowsEffected >0;
}

  Future<bool>deletNote({required int deletIdD})async{
    Database db = await initDB();
    int rowsEffected = await db.delete(NOTE_TABLE,where: '$NOTE_COLUMN_ID = ?',whereArgs: ['$deletIdD']);
    return rowsEffected >0;
  }
}