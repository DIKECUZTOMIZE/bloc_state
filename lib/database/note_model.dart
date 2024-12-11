import 'package:block/database/dbHeleper.dart';

class NoteModel {
  int? idM;
  String titleM;
  String descM;

  NoteModel({this.idM, required this.titleM, required this.descM});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        idM: map[DbHelper.COLUMN_NOTE_ID],
        titleM: map[DbHelper.COLUMN_NOTE_TITLE],
        descM: map[DbHelper.COLUMN_NOTE_DESC]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_NOTE_TITLE: titleM,
      DbHelper.COLUMN_NOTE_DESC: descM
    };
  }
}
