import 'package:flutter_bloc/flutter_bloc.dart';

class TagCubit extends Cubit<List<String>> {
  TagCubit() : super([]);

  void addTag(String tag) {
    if (state.length != 5) {
      final newList = List<String>.from(state);
      newList.add(tag);
      emit(newList);
    }
  }

  void removeTag(String tag) {
    final newList = List<String>.from(state);
    newList.remove(tag);
    emit(newList);
  }
}
