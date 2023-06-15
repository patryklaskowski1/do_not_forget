import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_page_state.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit() : super(AddPageState());

  Future<void> add(
    String title,
    String description,
    DateTime releaseDate,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('items').add(
        {
          'Title': title,
          'Description': description,
          'release_date': releaseDate,
        },
      );
      emit(const AddPageState(saved: true));
    } catch (error) {
      emit(AddPageState(errorMessage: error.toString()));
    }
  }
}
