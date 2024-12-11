
import 'package:block/compear/list/bloc_event.dart';
import 'package:block/compear/list/list_filse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page22 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: (){

            /// Block
            context.read<ListPC>().add(AddNote(
              titleE: 'sanjit',
              descE: '98788'
            ));

            /// Cubit:
            //   context.read<ListPC>().addNote(map: {
            //     'title' : 'sanjit',
            //     'desc'  :  '9678844'
            //   });

           /// Provider:
           // context.read<ListPC>().addNotes();
          }, child: Text('Add')))
        ],),);}}