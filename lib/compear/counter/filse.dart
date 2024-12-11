

import 'package:block/compear/counter/bloc_event.dart';
import 'package:block/compear/counter/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///1. Class:

/// Provider
//class Filse extends ChangeNotifier{

/// Cubit:
//class Filse extends Cubit<int>{
 // class Filse extends Cubit<CubiteState>{
  class Filse extends Bloc<BlocCountEvent,CubiteState>{


  /// 2.Data Handle: InitialValue (0) Constructor

  /// Provider:
   // int _count = 0;

  /// Cubut:

    //Filse() : super(0);

   // Filse() : super(CubiteState(count: 0));

    /// Block: Direct Construnctir bhitorot use kora hoi event bur
    Filse() : super(CubiteState(count: 0)){
      on<IncrementCountEvnet>((event, emit) {
        emit(CubiteState(count: state.count +1));
      },);

      on<DecrementCountEvent>((event, emit) {
        emit(CubiteState(count: state.count -1));
      },);
    }


  /// 3.Event:
 ///  Provider:
 //   void incrementCount(){
 //     _count++;
 //     notifyListeners();
 //   }
 //
 // void decremnetCount(){
 //     _count--;
 //     notifyListeners();
 // }
 //
 // int getNotse()=>_count;


 /// Cubit:
//   void incrementCount(){
//     emit(CubiteState(count:state.count +1));
//
//   }
//
//   void decrementCount(){
//     emit(CubiteState(count:state.count -1));
//   }

}