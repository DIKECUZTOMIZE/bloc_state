import 'package:block/list/filse.dart';
import 'package:block/list/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main (){
  runApp(
      /// Provider:
      //ChangeNotifierProvider(create:(context) => PCBFisle(),child: App())

      ///Cubit
       BlocProvider(create:(context) => PCBFisle(),child: App())
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}
