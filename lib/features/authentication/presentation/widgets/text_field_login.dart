import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
        ),
        SizedBox(height: 10),
        Focus(
          child: Builder(
            builder: (context) {
              final hasFocus = Focus.of(context).hasFocus;

              return AnimatedContainer(
                duration: Duration(seconds: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: hasFocus
                      ? [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.7),
                            blurRadius: 5,
                            spreadRadius: 0.5,
                          ),
                        ]
                      : [],
                ),

                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(1),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.25),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue.withOpacity(0.7),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
