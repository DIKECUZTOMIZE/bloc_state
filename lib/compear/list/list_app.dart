import 'package:block/compear/list/list_filse.dart';
import 'package:block/compear/list/page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(

    ///Provider:
     // ChangeNotifierProvider(create: (context) =>ListPC(), child: PCBApp()));
      
    /// Cubit
    //   BlocProvider(create: (context) =>ListPC(), child: PCBApp()));
      
   ///  Block:
       BlocProvider(create: (context) => ListPC(),child: PCBApp()));
}

class PCBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page12(),
    );}}
