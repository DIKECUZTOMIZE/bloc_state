import 'package:block/database/note_model.dart';

class DatabaseEvent {}

class AddNote extends DatabaseEvent {
  // String titleE;
  // String descE;
  // {required this.titleE,required this.descE}
  NoteModel newNote;
  AddNote({required this.newNote});
}

class GetInitialNotes extends DatabaseEvent {}

class UpadteNote extends DatabaseEvent {
  int idUE;
  String titleUE;
  String descUE;

  UpadteNote({required this.idUE, required this.titleUE, required this.descUE});
}

class DeletNote extends DatabaseEvent {
  int idDE;
  DeletNote({required this.idDE});
}
