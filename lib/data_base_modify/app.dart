import 'package:block/data_base_modify/dbHelper.dart';
import 'package:block/data_base_modify/filse.dart';
import 'package:block/data_base_modify/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => BlocFilse(dbHelper: DbHelper.getInstance()),
      child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}
