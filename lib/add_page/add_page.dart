import 'package:do_not_forget/add_page/cubit/add_page_cubit.dart';
import 'package:do_not_forget/repositories/items_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _description;
  String? _title;
  DateTime? _releaseDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPageCubit(ItemsRepository()),
      child: BlocListener<AddPageCubit, AddPageState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddPageCubit, AddPageState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 114, 113, 113),
              appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 3, 253, 241),
                  size: 28,
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
                actions: [
                  IconButton(
                    onPressed: _title == null ||
                            _description == null ||
                            _releaseDate == null
                        ? null
                        : () {
                            context.read<AddPageCubit>().add(
                                  _title!,
                                  _description!,
                                  _releaseDate!,
                                );
                          },
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
              body: _AddPageBody(
                onTitleChanged: (newValue) {
                  setState(() {
                    _title = newValue;
                  });
                },
                onDescriptionChanged: (newValue) {
                  setState(() {
                    _description = newValue;
                  });
                },
                onDateChanged: (newValue) {
                  setState(() {
                    _releaseDate = newValue;
                  });
                },
                selectedDateFormatted: _releaseDate == null
                    ? null
                    : DateFormat.yMMMMEEEEd().format(_releaseDate!),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    Key? key,
    required this.onTitleChanged,
    required this.onDescriptionChanged,
    required this.onDateChanged,
    this.selectedDateFormatted,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onDescriptionChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onTitleChanged,
          style: const TextStyle(
            color: Color.fromARGB(255, 3, 253, 241),
          ),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 3, 253, 241), width: 5),
            ),
            hintText: 'visit to the cinema',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
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
        TextField(
          onChanged: onDescriptionChanged,
          style: const TextStyle(
            color: Color.fromARGB(255, 3, 253, 241),
          ),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 3, 253, 241), width: 5),
            ),
            hintText: 'Avatar premiere',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
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
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
            onDateChanged(selectedDate);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(129, 41, 37, 37),
          ),
          child: Text(
            selectedDateFormatted ?? 'Choose release date',
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 253, 241),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
