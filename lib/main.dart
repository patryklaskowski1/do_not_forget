import 'package:do_not_forget/add_page/add_page.dart';
import 'package:do_not_forget/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Do Not Forget',
      home: HomePage(),
    );
  }
}
