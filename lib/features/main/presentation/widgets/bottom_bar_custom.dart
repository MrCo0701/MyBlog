import 'package:flutter/material.dart';

class BottomBarCustom extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const BottomBarCustom({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (i) {
          final isSelected = index == i;

          return GestureDetector(
            onTap: () => onTap(i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  i == 0
                      ? Icons.home
                      : i == 1
                      ? Icons.book
                      : Icons.person,
                  size: isSelected ? 30 : 24,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
                const SizedBox(height: 6), // <-- chỉnh khoảng cách icon – text
                Text(
                  ["Home", "Blog", "Me"][i],
                  style: TextStyle(
                    fontSize: isSelected ? 14 : 12,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
