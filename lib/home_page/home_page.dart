import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_not_forget/add_page/add_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 113, 113),
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
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0),
          ),
        ),
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(129, 41, 37, 37),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(129, 41, 37, 37),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 3, 253, 241),
          size: 42,
        ),
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection("items").snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: [],
            );
          }),
    );
  }
}
