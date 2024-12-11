import 'package:block/count/bloc_event.dart';
import 'package:block/count/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(

       appBar:AppBar(title: Text('Page 1'),
       ) ,
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Center(
             child: ElevatedButton(onPressed: (){
               context.read<CounterBloc>().add(IncrementCountEvent());
             }, child: Text('+')),
           ),

           SizedBox(height: 11,),

           ElevatedButton(onPressed: (){
             context.read<CounterBloc>().add(DecrementCountEvent());
           }, child: Text('-')),
         ],
       ),
     );
  }
}