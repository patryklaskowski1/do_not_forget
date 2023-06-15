import 'package:do_not_forget/add_page/cubit/add_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _title;
  String? _description;
  DateTime? _releaseDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPageCubit(),
      child: BlocBuilder<AddPageCubit, AddPageState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 114, 113, 113),
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Color.fromARGB(255, 3, 253, 241),
              ),
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
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 80.0),
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
              children: [
                const TextField(
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
                const SizedBox(height: 40),
                const TextField(
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(129, 41, 37, 37),
                  ),
                  child: const Text(
                    'Choose release date',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 253, 241),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
