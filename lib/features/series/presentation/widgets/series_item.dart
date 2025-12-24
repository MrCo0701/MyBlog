import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/core/utils/date_fomartter.dart';
import 'package:my_blog/features/detail/presentation/cubits/detail/detail_cubit.dart';
import 'package:my_blog/features/detail/presentation/cubits/detail/detail_state.dart';
import 'package:my_blog/features/detail/presentation/di/detail_di.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/home/presentation/pages/tag_screen.dart';
import 'package:my_blog/features/home/presentation/widgets/footer_card.dart';
import 'package:my_blog/features/series/data/models/series_with_count/seri_with_count_model.dart';

import '../../../../core/utils/delta_converter.dart';

class SeriesItem extends StatelessWidget {
  final SeriesWithCountModel seri;
  final String image;
  final VoidCallback onPressMore;
  final VoidCallback onPressed;
  final IconData? iconSelected;

  const SeriesItem({
    super.key,
    required this.seri,
    this.iconSelected,
    required this.image,
    required this.onPressMore,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: image == ''
                      ? AssetImage('assets/fake_data/user_image.png')
                      : NetworkImage(image),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      seri.author.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      DateFormatter.formatDate(seri.createdAt.toString()),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    iconSelected ?? Icons.more_vert,
                    size: 30,
                    color: iconSelected != null
                        ? Colors.lightGreen
                        : Colors.black,
                  ),
                  onPressed: onPressMore,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Title
            Text(
              seri.title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              '${seri.count.posts} posts in this series',
              style: TextStyle(color: Colors.grey.shade700, height: 1.3),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
