import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../app/widgets/icon_text.dart';

class InformationBlogDetail extends StatelessWidget {
  const InformationBlogDetail({
    super.key,
    required this.time,
    required this.views,
    this.timeRead,
    this.countOfPosts,
  });

  final String time;
  final int views;
  final int? timeRead;
  final int? countOfPosts;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: [
            IconText(icon: Iconsax.calendar_copy, text: time),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              color: Colors.grey.shade700.withOpacity(0.5),
              width: 1.5,
            ),

            IconText(icon: Iconsax.eye_copy, text: '$views views'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              color: Colors.grey.shade700.withOpacity(0.5),
              width: 1.5,
            ),

            timeRead != null
                ? IconText(icon: Iconsax.clock_copy, text: '$timeRead min read')
                : IconText(
                    icon: Iconsax.book_1_copy,
                    text: '$countOfPosts posts',
                  ),
          ],
        ),
      ),
    );
  }
}
