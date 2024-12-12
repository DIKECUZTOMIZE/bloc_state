import 'package:block/data_base_modify/note_model.dart';

abstract  class BlocState {}

class  InitialState extends BlocState{}

class  LoadingState extends BlocState{}

class  LoadedState extends BlocState{
  List<NoteModel> mDataS;
  LoadedState({required this.mDataS});
}

class  ErorrState extends BlocState{
  String erorrMess;
  ErorrState({required this.erorrMess});
}