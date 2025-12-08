import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController controller;
  final VoidCallback onPressed;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: BoxBorder.fromBorderSide(
          BorderSide(color: Colors.black26, width: 2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black26),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(icon, color: Colors.black26, size: 30),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
