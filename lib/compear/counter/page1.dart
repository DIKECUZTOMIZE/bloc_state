import 'package:block/compear/counter/filse.dart';
import 'package:block/compear/counter/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child:
        
        /// Provider Ui reflect(watch)  
        //Text('${context.watch<Filse>().getNotse()}'),

        /// Cubit Ui reflect(watch)
        Text('${context.watch<Filse>().state.count}')
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(),));
      },child: Text('Add'),),
    );
  }
}