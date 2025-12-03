import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillCubit extends Cubit<Set<String>> {
  QuillCubit() : super({});

  void toggle(QuillController quillController, Attribute attr) {
    final style = quillController.getSelectionStyle();
    final active = style.attributes.containsKey(attr.key);

    if (active) {
      quillController.formatSelection(Attribute(attr.key, attr.scope, null));
      emit({...state}..remove(attr.key));
    } else {
      quillController.formatSelection(attr);
      emit({...state, attr.key});
    }
  }

  bool isActive(String key) => state.contains(key);
}
