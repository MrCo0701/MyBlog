import 'package:flutter/material.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/home/presentation/pages/tag_screen.dart';
import 'package:my_blog/features/home/presentation/widgets/footer_card.dart';

import '../../../../core/utils/delta_converter.dart';

class PostCard extends StatelessWidget {
  final BlogEntity blog;
  final String image;
  final VoidCallback onPressMore;
  final VoidCallback onPressed;

  const PostCard({
    super.key,
    required this.blog,
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
                CircleAvatar(radius: 20, backgroundImage: AssetImage(image)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog.author.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      blog.createdAt.toString(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.more_vert, size: 25),
                  onPressed: onPressMore,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Title
            Text(
              blog.title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Description
            deltaToPlainText(blog.content) != ''
                ? Text(
                    deltaToPlainText(blog.content),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700, height: 1.3),
                  )
                : SizedBox(),

            const SizedBox(height: 10),

            // Tags
            Wrap(
              spacing: 8,
              children: blog.tags.map((t) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TagScreen(tag: t.slug)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE7FF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      t.name,
                      style: const TextStyle(
                        color: Color(0xFF7C4DFF),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            // footer icons
            FooterCard(
              viewCount: blog.viewCount,
              commentCount: 0,
              readCount: blog.readTime,
            ),
          ],
        ),
      ),
    );
  }
}
