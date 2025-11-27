import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class QuillCustomToolbarEditor extends StatefulWidget {
  final QuillController controller;
  final bool showEditor;

  const QuillCustomToolbarEditor({
    super.key,
    required this.controller,
    this.showEditor = true,
  });

  @override
  State<QuillCustomToolbarEditor> createState() =>
      _QuillCustomToolbarEditorState();
}

class _QuillCustomToolbarEditorState extends State<QuillCustomToolbarEditor> {
  final FocusNode _focusNode = FocusNode();

  bool _isActive(Attribute attr) {
    final style = widget.controller.getSelectionStyle();
    return style.attributes.containsKey(attr.key);
  }

  void _toggle(Attribute attribute) {
    final active = _isActive(attribute);

    if (active) {
      widget.controller.formatSelection(
        Attribute(attribute.key, attribute.scope, null),
      );
    } else {
      widget.controller.formatSelection(attribute);
    }

    setState(() {});
    _focusNode.requestFocus();
  }

  Widget _buildButton({required IconData icon, required Attribute attribute}) {
    final active = _isActive(attribute);

    return IconButton(
      icon: Icon(icon, color: active ? Colors.blue : Colors.black, size: 20),
      onPressed: () => _toggle(attribute),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // ===== Custom toolbar =====
          Row(
            children: [
              _buildButton(icon: Icons.format_bold, attribute: Attribute.bold),
              _buildButton(
                icon: Icons.format_italic,
                attribute: Attribute.italic,
              ),
              _buildButton(
                icon: Icons.format_underline,
                attribute: Attribute.underline,
              ),
              _buildButton(
                icon: Icons.strikethrough_s,
                attribute: Attribute.strikeThrough,
              ),
              _buildButton(icon: Icons.code, attribute: Attribute.codeBlock),
            ],
          ),

          // ===== Editor =====
          if (widget.showEditor)
            Expanded(
              child: QuillEditor(
                controller: widget.controller,
                focusNode: _focusNode,
                scrollController: ScrollController(),
                // scrollable: true,
                // readOnly: false,
                // expands: true,
                // padding: const EdgeInsets.all(8),
              ),
            ),
        ],
      ),
    );
  }
}
