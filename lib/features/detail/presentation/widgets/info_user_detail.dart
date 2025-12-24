import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/home/domain/entity/author_entity.dart';

import '../../../home/domain/entity/blog_entity.dart';

class InformationUserDetail extends StatelessWidget {
  const InformationUserDetail({
    super.key,
    required this.author,
    required this.isFollowing,
    required this.followAction,
  });

  final AuthorEntity author;
  final bool isFollowing;
  final VoidCallback followAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* Avatar and name
        Row(
          children: [
            CircleAvatar(
              backgroundImage: author.avatarUrl != null
                  ? NetworkImage(author.avatarUrl!)
                  : AssetImage('assets/fake_data/user_image.png'),
            ),
            SizedBox(width: 10),
            Text(
              author.fullName,
              style: TextStyle(
                color: Colors.blueAccent.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        //* Follow button
        ElevatedButton(
          onPressed: followAction,
          style: ElevatedButton.styleFrom(
            backgroundColor: isFollowing
                ? Colors.blueAccent.shade700
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(color: Colors.blueAccent, width: 2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user_cirlce_add_copy,
                color: isFollowing ? Colors.white : Colors.blueAccent.shade700,
              ),
              SizedBox(width: 10),
              Text(
                isFollowing ? 'UnFollow' : 'Follow',
                style: TextStyle(
                  color: isFollowing
                      ? Colors.white
                      : Colors.blueAccent.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
