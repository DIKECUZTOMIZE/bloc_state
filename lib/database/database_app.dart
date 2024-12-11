import 'package:block/database/database_bock.dart';
import 'package:block/database/dbHeleper.dart';
import 'package:block/database/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => DatabaseBloc(dbHelper: DbHelper.getInstance()),
      child: DatabaseApp()));
}

class DatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Page1(),
    );
  }
}
