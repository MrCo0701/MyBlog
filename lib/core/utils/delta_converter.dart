import 'package:flutter_quill/flutter_quill.dart';
import '../../features/home/data/models/quill/quill_model.dart';

extension DeltaOpModelX on DeltaOpModel {
  Map<String, dynamic> toJsonMap() {
    return {'insert': insert, if (attributes != null) 'attributes': attributes};
  }
}

List<Map<String, dynamic>> toDeltaJson(List<DeltaOpModel> ops) {
  return ops.map((e) => e.toJsonMap()).toList();
}

Document deltaToDocument(List<DeltaOpModel> ops) {
  return Document.fromJson(toDeltaJson(ops));
}

String deltaToPlainText(List<DeltaOpModel> ops) {
  return deltaToDocument(ops).toPlainText();
}
