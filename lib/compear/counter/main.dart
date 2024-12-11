import 'package:block/compear/counter///filse.dart';
import 'package:block/compear/counter////page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  /// Injection Dependency:
  /// Provider:
  //runApp(ChangeNotifierProvider(create: (context) => Filse(),child: App()));
  /// Cubite
  runApp(BlocProvider(create: (context) => Filse(),child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}
