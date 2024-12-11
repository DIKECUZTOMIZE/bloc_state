class BlockEvent {}

class AddNote extends BlockEvent{
  String titleE;
  String descE;
  AddNote({required this.titleE,required this.descE});
}

class UpdateNote extends BlockEvent{

 int idE;
 // String titleE;
 // String descE;
 Map<String,dynamic>map;
  UpdateNote({required this.map ,required this.idE});
}

class DeletNote extends BlockEvent{
  int deletIdE;
  DeletNote({required this. deletIdE});
}


