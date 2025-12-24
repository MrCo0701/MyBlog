import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/series/presentation/cubits/select_post/select_post_state.dart';

class SelectPostCubit extends Cubit<SelectPostState> {
  SelectPostCubit() : super(SelectPostState(listPostId: []));

  void toggleSelection(String id) {
    final updatedList = List<String>.from(state.listPostId);

    if (updatedList.contains(id)) {
      updatedList.remove(id);
    } else {
      updatedList.add(id);
    }

    emit(state.copyWith(selectedIds: updatedList));
  }
}
