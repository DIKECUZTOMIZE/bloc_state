import 'package:block/data_base_modify/dbHelper.dart';
import 'package:block/data_base_modify/event.dart';
import 'package:block/data_base_modify/note_model.dart';
import 'package:block/data_base_modify/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFilse extends Bloc<BlocEvent,BlocState>{

  DbHelper dbHelper;
  List<NoteModel> mDataF=[];
  BlocFilse({required this.dbHelper}) : super(InitialState()){

    on<AddNote>((event, emit)async {

      emit(LoadingState());
      bool check =await dbHelper.addNote(event.addnotsE);
      if(check){
        mDataF = await dbHelper.fectsNote();
        emit(LoadedState(mDataS: mDataF));
      }
      else {
        emit(ErorrState(erorrMess: 'Not Add Notes yet!!'));
      }
    },);

    on<UpdateNote>((event, emit)async {
      emit(LoadingState());

      bool check = await dbHelper.updateNotes(event.updateNoteE);
      // bool check = await dbHelper.updateNotes(
      //     titleUD: event.updateNoteE.titleM,
      //     descUD: event.updateNoteE.descM,
      //    // updateIdD:event.updateIdE
      //     updateIdD:event.updateNoteE.idM!
      // );
      if(check){
        mDataF = await dbHelper.fectsNote();
        emit(LoadedState(mDataS: mDataF));
      }
    },);

    on<DeletNote>((event, emit) async{
      emit(LoadingState());
      bool check = await dbHelper.deletNote(deletIdD: event.deletIdE);
      if(check){
        mDataF = await dbHelper.fectsNote();
        emit(LoadedState(mDataS: mDataF));
      }
    },);
  }

    void getInitialNotes()async{

    emit(LoadingState());
     mDataF= await dbHelper.fectsNote();
     emit(LoadedState(mDataS: mDataF));
  }

}