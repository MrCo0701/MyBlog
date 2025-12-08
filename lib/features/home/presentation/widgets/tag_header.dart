import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/home/presentation/widgets/tag_info.dart';

class TagHeader extends StatelessWidget {
  final double percent;
  final String nameTag;
  final int postsCount;

  const TagHeader({
    super.key,
    required this.percent,
    required this.nameTag,
    required this.postsCount,
  });

  @override
  Widget build(BuildContext context) {
    double avatarSize = lerpDouble(48, 100, percent)!;
    double titleSize = lerpDouble(14, 22, percent)!;

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.only(bottom: 12),
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: avatarSize,
            height: avatarSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            alignment: Alignment.center,
            child: Text(nameTag, style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 8),

          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE7FF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                nameTag,
                style: const TextStyle(
                  color: Color(0xFF7C4DFF),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),

          Opacity(
            opacity: percent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TagInfo(label: "posts", value: postsCount.toString()),
                TagInfo(label: "questions", value: "0"),
                TagInfo(label: "followers", value: "0"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Opacity(
            opacity: percent,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.add_copy, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
