import 'package:flutter/material.dart';

class TagInput extends StatelessWidget {
  const TagInput({
    super.key,
    required this.controller,
    required this.acceptAction,
    required this.listTags,
    required this.removeTag,
  });

  final TextEditingController controller;
  final ValueChanged<String> acceptAction;
  final ValueChanged<String> removeTag;
  final List<String> listTags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Post Tags',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black.withOpacity(0.25)),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: listTags.isEmpty
              ? Text(
                  'Tag your post. Maximum 5 tags, at least 1 tag',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 17,
                  ),
                )
              : Wrap(
                  spacing: 8,
                  children: listTags.map((t) {
                    return GestureDetector(
                      onTap: () {
                        removeTag(t);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE7FF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          t,
                          style: const TextStyle(
                            color: Color(0xFF7C4DFF),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ),
        TextField(
          onSubmitted: acceptAction,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(1),
            hintText: '',
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.25),
                width: 1.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.25),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.25),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
