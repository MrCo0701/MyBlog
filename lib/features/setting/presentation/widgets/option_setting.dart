import 'package:flutter/material.dart';

class OptionSetting extends StatelessWidget {
  const OptionSetting({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black26, width: 2),
                ),
                padding: EdgeInsets.all(15),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Icon(Icons.chevron_right, size: 30, color: Colors.black54),
        ],
      ),
    );
  }
}
