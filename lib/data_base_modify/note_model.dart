import 'package:block/data_base_modify/dbHelper.dart';

class NoteModel{

  int? idM;
  String titleM;
  String descM;

  NoteModel({required this.titleM,required this.descM,this.idM});

  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(
        idM: map[DbHelper.NOTE_COLUMN_ID],
        titleM: map[DbHelper.NOTE_COLUMN_TITLE],
        descM: map[DbHelper.NOTE_COLUMN_DESC]);
  }

  Map<String,dynamic>toMap(){
    return {
      DbHelper.NOTE_COLUMN_TITLE:titleM,
      DbHelper.NOTE_COLUMN_DESC:descM,
    };
  }
}