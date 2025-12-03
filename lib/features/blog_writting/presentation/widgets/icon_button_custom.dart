import 'package:flutter/material.dart';

class IconButtonCustom extends StatefulWidget {
  const IconButtonCustom({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  State<IconButtonCustom> createState() => _IconButtonCustomState();
}

class _IconButtonCustomState extends State<IconButtonCustom> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isClick
            ? Colors.blueAccent.withOpacity(0.2)
            : Colors.transparent,
      ),
      child: IconButton(
        onPressed: () {
          widget.onPressed();
          isClick = !isClick;
          setState(() {});
        },
        icon: Icon(widget.icon),
      ),
    );
  }
}
