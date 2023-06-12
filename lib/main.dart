import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do Not Forget',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Do Not Forget',
            style: TextStyle(
              color: Color.fromARGB(255, 3, 253, 241),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 80.0)),
          ),
          toolbarHeight: 120,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(129, 41, 37, 37),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromARGB(129, 41, 37, 37),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 3, 253, 241),
            size: 42,
          ),
        ),
      ),
    );
  }
}
