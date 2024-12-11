import 'package:block/database/database_event.dart';
import 'package:block/database/database_state.dart';
import 'package:block/database/dbHeleper.dart';
import 'package:block/database/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DataBaseState> {
  DbHelper dbHelper;

  List<NoteModel> mDataF = [];
  DatabaseBloc({required this.dbHelper}) : super(DataBaseState(mDataS: [])) {
    on<AddNote>(
      (event, emit) async {
        bool check = await dbHelper.addNote(event.newNote);
        if (check) {
          mDataF = await dbHelper.fectNotes();
          emit(DataBaseState(mDataS: mDataF));
        }
      },
    );

    on<GetInitialNotes>(
      (event, emit) async {
        mDataF = await dbHelper.fectNotes();
        emit(DataBaseState(mDataS: mDataF));
      },
    );

    on<UpadteNote>(
      (event, emit) async {
        bool check = await dbHelper.updateNote(
            updateIdD: event.idUE, titleD: event.titleUE, descD: event.descUE);
        if (check) {
          mDataF = await dbHelper.fectNotes();
          emit(DataBaseState(mDataS: mDataF));
        }
      },
    );

    on<DeletNote>(
      (event, emit) async {
        bool check = await dbHelper.deletNote(deletIdD: event.idDE);
        if (check) {
          mDataF = await dbHelper.fectNotes();
          emit(DataBaseState(mDataS: mDataF));
        }
      },
    );
  }


  /// Aitu eatch kuribor babe dibi pare ba nidilio hoi karon diret state.mDataS kuri dibo pare
  // List<NoteModel> getnotes() => mDataF;

  // void getInitial() async {
  //   mDataF = await dbHelper.fectNotes();
  //   emit(DataBaseState(mDataS: mDataF));
  // }
}
