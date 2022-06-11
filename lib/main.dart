import 'package:flutter/material.dart';
import 'package:money_manager_app/pages/add_trasaction.dart';
import 'package:money_manager_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      home: const AddTransaction(),
    );
  }
}
