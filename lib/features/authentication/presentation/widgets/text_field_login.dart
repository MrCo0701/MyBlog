import 'package:flutter/material.dart';
import 'package:my_blog/features/authentication/domain/validators/input_validator.dart';

enum FieldType { email, fullName, password, confirmPassword }

class TextFieldLogin extends StatefulWidget {
  const TextFieldLogin({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.type,
    this.compareController,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextEditingController? compareController;
  final FieldType type;

  @override
  State<TextFieldLogin> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {
  bool _obscure = true;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 10),
        Focus(
          child: Builder(
            builder: (context) {
              final isPassword =
                  widget.type == FieldType.password ||
                  widget.type == FieldType.confirmPassword;
              final hasFocus = Focus.of(context).hasFocus;

              return AnimatedContainer(
                duration: Duration(seconds: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: hasFocus && error == false
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
                  controller: widget.controller,
                  obscureText: isPassword ? _obscure : false,
                  validator: (value) {
                    final text = value ?? '';
                    setState(() {
                      error = true;
                    });

                    switch (widget.type) {
                      case FieldType.fullName:
                        return InputValidator.validateFullName(text);

                      case FieldType.email:
                        return InputValidator.validateEmail(text);

                      case FieldType.password:
                        return InputValidator.validatePassword(text);

                      case FieldType.confirmPassword:
                        return InputValidator.validateConfirmPassword(
                          text,
                          widget.compareController!.text,
                        );
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(1),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() => _obscure = !_obscure);
                            },
                          )
                        : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 12),
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
