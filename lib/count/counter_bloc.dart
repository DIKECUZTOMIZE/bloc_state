import 'package:block/count/bloc_event.dart';
import 'package:block/count/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///  Step.3:

/// A.Bloc duta bstu aspect kore event aru state
class CounterBloc extends Bloc<CounterEvent,CounterState>{

  ///B. Initial State
  CounterBloc() : super(CounterState(count: 0)){

   ///  function
     on<IncrementCountEvent>((event, emit){
       emit(CounterState(count: state.count +1));
     },);

     on<DecrementCountEvent>((event, emit){

       if(state.count > 0) {

         emit(CounterState(count: state.count - 1));

       }},);
  }
}