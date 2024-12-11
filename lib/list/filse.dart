

import 'package:block/list//event.dart';
import 'package:block/list//state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PCBFisle extends Bloc<ListEvenet,ListState> {

  /// Dta Hnadl:
     PCBFisle() : super (ListState(mDataS: [])){

       on<AddNote>((event, emit) {

         List<Map<String, dynamic>> currentData = state.mDataS;
         currentData.add(event.mapE);
         emit(ListState(mDataS: currentData));
       },);

       on<UpdateNote>((event, emit) {
         var currentData = state.mDataS;
         currentData[event.idUE]=event.mapE;
         emit(ListState(mDataS: currentData));

       },);

       on<DeletNote>((event, emit) {
         var currentdata = state.mDataS;
         currentdata.removeAt(event.idDE);
         emit(ListState(mDataS:currentdata));
       },);
     }




}