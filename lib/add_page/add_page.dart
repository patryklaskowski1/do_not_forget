import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 113, 113),
      appBar: AppBar(
        title: const Text(
          "Add Event",
          style: TextStyle(
            color: Color.fromARGB(255, 3, 253, 241),
            fontSize: 28,
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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 80,
        ),
        children: const [
          TextField(
            style: TextStyle(
              color: Color.fromARGB(255, 3, 253, 241),
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 3, 253, 241), width: 5),
              ),
              hintText: 'visit to the cinema',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 3, 253, 241),
                fontSize: 18,
              ),
              label: Text(
                'Title',
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 253, 241),
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          TextField(
            style: TextStyle(
              color: Color.fromARGB(255, 3, 253, 241),
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 3, 253, 241), width: 5),
              ),
              hintText: 'Avatar premiere',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 3, 253, 241),
                fontSize: 18,
              ),
              label: Text(
                'Description',
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 253, 241),
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
