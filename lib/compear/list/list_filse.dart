import 'package:block/compear/list/bloc_event.dart';
import 'package:block/compear/list/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

///* Class

class ListPC extends Bloc<BlockEvent,ListState> {

  /// Cubit_list
//class ListPC extends Cubit<ListState>{

  /// Provider:
//class ListPC extends ChangeNotifier{

  ///* Data Hnandle : Initial value = empity

  /// Block: Event and data

  List<Map<String, dynamic>> mData = [];

     //var id1;
     int? id1 ;
    String title1='';
    String desc1='';
 // Map<String,dynamic>map=[];

  ListPC() : super(ListState(mDataL: [])) {

    on<AddNote>((event, emit) {
      List<Map<String, dynamic>> currentData = state.mDataL;
      currentData.add({
       'title' : event.titleE,
        'desc'   :event.descE
      });
      emit(ListState(mDataL: currentData));
    });

    on<UpdateNote>((event, emit) {
      var currentData = state.mDataL;

    //  int id1 = currentData.length;
      currentData [event.idE] =event.map;
       emit(ListState(mDataL:currentData));

    },);

    on<DeletNote>((event, emit) {
      var currentData = state.mDataL;
      currentData.removeAt(event.deletIdE);
      emit(ListState(mDataL: currentData));
    },);}}

  /// Cubit:
    //ListPC()  : super(ListState(mDataL: []));

    /// Provider:
   //  List<Map<String,dynamic>> mDataF=[];


/// Event:

  /// Cubit
//     void addNote({required Map<String,dynamic>map}){
//       List<Map<String,dynamic>> currentData = state.mDataL;
//       currentData.add(map);
//       emit(ListState(mDataL: currentData));
//     }
//
//     void update({required Map<String,dynamic>map,required int updateIdF}){
//        var currentData =state.mDataL;
//        currentData[updateIdF]=map;
//        emit(ListState(mDataL: currentData));
//     }
//
//     void deletNote({required int deletIdF}){
//       var currentData = state.mDataL;
//       currentData.removeAt(deletIdF);
//       emit(ListState(mDataL: currentData));
//     }
//
//     void getNotes()=>state.mDataL;



/// Provider:

 //  void addNotes( ){
 //   mDataF.add({
 //   'title': 'sanjit',
 //     'desc': 'keleng'
 //   });
 //   notifyListeners();
 // }

 //  void updateNotes({required String title, required String desc,required int nId}) {
 //    mDataF[nId] = {
 //      'title': title,
 //      'desc': desc
 //    };
 //    notifyListeners();
 //  }

 //  void deletNots({required int deletidF}){
 //    mDataF.removeAt(deletidF);
 //    notifyListeners();
 // }

 //  List<Map<String,dynamic>> getNotes()=> mDataF;
//}
