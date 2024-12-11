
import 'package:block/compear/counter/bloc_event.dart';
import 'package:block/compear/counter/filse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget{
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
            Provider.of<Filse>(context,listen: false).add(IncrementCountEvnet());
          }, child: Text('+')),),

          SizedBox(
            height: 11,
          ),

          Center(child: ElevatedButton(onPressed: (){
            context.read<Filse>().add(DecrementCountEvent());
         //   Navigator.pop(context);
          }, child: Text('-')),),
        ],
      ),
    );

  }
}