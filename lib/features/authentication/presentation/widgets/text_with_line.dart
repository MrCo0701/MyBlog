import 'package:flutter/material.dart';

class ButtonTextWithLine extends StatelessWidget {
  const ButtonTextWithLine({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.onPress,
  });

  final String text;
  final Color color;
  final double size;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: IntrinsicWidth(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: size,
              ),
            ),
            Container(
              height: 2,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
