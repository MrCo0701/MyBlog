import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/detail/presentation/pages/detail_screen.dart';
import 'package:my_blog/features/home/presentation/widgets/footer_card.dart';

class PostCard extends StatelessWidget {
  final String author;
  final String time;
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final VoidCallback onPressMore;

  const PostCard({
    super.key,
    required this.author,
    required this.time,
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
    required this.onPressMore,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (_) => DetailScreen(controller: ,)),
      // ),
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
                      author,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      time,
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
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Description
            description != ''
                ? Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700, height: 1.3),
                  )
                : SizedBox(),

            const SizedBox(height: 10),

            // Tags
            Wrap(
              spacing: 8,
              children: tags.map((t) {
                return Container(
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
                    t,
                    style: const TextStyle(
                      color: Color(0xFF7C4DFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            // footer icons
            FooterCard(),
          ],
        ),
      ),
    );
  }
}
