import 'package:flutter/material.dart';
import 'package:flutter_salt/screens/home_screen.dart';
import 'package:flutter_salt/screens/list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Row dan Column',
      home: ListScreen(),
    );
  }
}
