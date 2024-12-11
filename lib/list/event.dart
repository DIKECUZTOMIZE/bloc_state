class ListEvenet {}

class AddNote extends ListEvenet{
  Map<String,dynamic> mapE;
  AddNote({required this.mapE});
}

class UpdateNote extends ListEvenet{
  int idUE;
  Map<String,dynamic> mapE;
  UpdateNote({required this.idUE,required this.mapE});
}

class DeletNote extends ListEvenet{
  int idDE;
  DeletNote({required this.idDE});
}