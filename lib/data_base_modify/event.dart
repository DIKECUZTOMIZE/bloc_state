import 'package:block/data_base_modify/note_model.dart';

abstract  class BlocEvent {}

class AddNote extends BlocEvent{
  NoteModel addnotsE;
  AddNote({required this.addnotsE});
}

class UpdateNote extends BlocEvent{
  NoteModel updateNoteE;

   // int updateIdE;

  UpdateNote({required this.updateNoteE,});
//  UpdateNote({required this.updateNoteE, required this.updateIdE});
}

class DeletNote extends BlocEvent{
  int deletIdE;
  DeletNote({required this.deletIdE});
}