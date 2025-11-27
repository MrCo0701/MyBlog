import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillCubit extends Cubit<Set<String>> {
  final QuillController controller;

  QuillCubit(this.controller) : super({});

  void toggle(Attribute attr) {
    final style = controller.getSelectionStyle();
    final active = style.attributes.containsKey(attr.key);

    if (active) {
      controller.formatSelection(Attribute(attr.key, attr.scope, null));
      emit({...state}..remove(attr.key));
    } else {
      controller.formatSelection(attr);
      emit({...state, attr.key});
    }
  }

  bool isActive(String key) => state.contains(key);
}
