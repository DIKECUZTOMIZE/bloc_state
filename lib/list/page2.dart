import 'package:block/list/event.dart';
import 'package:block/list/filse.dart';
import 'package:block/list/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Page2'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: ElevatedButton(onPressed: (){

              /// Provider:
              context.read<PCBFisle>().add(AddNote(mapE: {
                'title' : 'sanjit keleng',
                'desc'  :  '9898'
              }));
            }, child: Text('add')),
          ),
      ],),
    );
  }
}
