import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'Calculator_Screen.dart';
import 'Cubit/BlocObserver.dart';
void main()
{
  runApp(MyApp());
  Bloc.observer = MyBlocObserver();
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home:CalculatorScreen() ,
    );
  }
}
