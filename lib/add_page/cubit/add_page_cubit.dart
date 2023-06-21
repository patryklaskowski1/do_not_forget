import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:do_not_forget/repositories/items_repository.dart';

part 'add_page_state.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit(this._itemsRepository) : super(const AddPageState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String description,
    DateTime releaseDate,
  ) async {
    try {
      await _itemsRepository.add(title, description, releaseDate);
      emit(const AddPageState(saved: true));
    } catch (error) {
      emit(AddPageState(errorMessage: error.toString()));
    }
  }
}
