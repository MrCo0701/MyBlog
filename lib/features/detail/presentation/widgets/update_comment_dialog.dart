import 'package:flutter/material.dart';

Future<void> showUpdateCommentDialog({
  required BuildContext context,
  required String oldContent,
  required Function(String content) onUpdate,
}) async {
  final contentController = TextEditingController(text: oldContent);

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => AlertDialog(
      title: const Text("Update Comment"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: contentController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            final newContent = contentController.text.trim();

            if (newContent.isEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Content is empty")));
              return;
            }

            onUpdate(newContent);
            Navigator.pop(context);
          },
          child: const Text("Update", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
