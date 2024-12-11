import 'dart:io';
import 'package:block/database/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper getInstance() => DbHelper._();

  Database? mData;

  static const NOTE_TABLE = 'n_table';
  static const COLUMN_NOTE_ID = 'n_id';
  static const COLUMN_NOTE_TITLE = 'n_title';
  static const COLUMN_NOTE_DESC = 'n_desc';

  Future<Database> initDB() async {
    mData = mData ?? await openDB();
    return mData!;
  }

  Future<Database> openDB() async {
    Directory dirPath = await getApplicationDocumentsDirectory();
    String dbPath = join(dirPath.path, 'noteDB.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'create table $NOTE_TABLE ( $COLUMN_NOTE_ID integer primary key autoIncrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text)');
      },
    );
  }

  Future<bool> addNote(NoteModel newtNote) async {
    Database db = await initDB();
    int rowsEffected = await db.insert(NOTE_TABLE, newtNote.toMap());
    return rowsEffected > 0;
  }

  Future<List<NoteModel>> fectNotes() async {
    Database db = await initDB();
    List<Map<String, dynamic>> allNotes = await db.query(NOTE_TABLE);

    List<NoteModel> newListNote = [];

    for (Map<String, dynamic> eachData in allNotes) {
      NoteModel eachNotes = NoteModel.fromMap(eachData);
      newListNote.add(eachNotes);
      //  return newListNote;
    }
    return newListNote;
  }

  Future<bool> updateNote(
      {required updateIdD,
      required String titleD,
      required String descD}) async {
    Database db = await initDB();
    int rowsEffected = await db.update(
        NOTE_TABLE, {COLUMN_NOTE_TITLE: titleD, COLUMN_NOTE_DESC: descD},
        where: '$COLUMN_NOTE_ID = ?', whereArgs: ['$updateIdD']);
    return rowsEffected > 0;
  }

  Future<bool> deletNote({required deletIdD}) async {
    Database db = await initDB();
    int rowsEffected = await db.delete(NOTE_TABLE,
        where: '$COLUMN_NOTE_ID = ?', whereArgs: ["$deletIdD"]);
    return rowsEffected > 0;
  }
}
