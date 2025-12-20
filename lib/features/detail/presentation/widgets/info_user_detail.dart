import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../home/domain/entity/blog_entity.dart';

class InformationUserDetail extends StatelessWidget {
  const InformationUserDetail({
    super.key,
    required this.blog,
    required this.followAction,
  });

  final BlogEntity blog;
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
              backgroundImage: blog.author.avatarUrl != null
                  ? NetworkImage(blog.author.avatarUrl!)
                  : AssetImage('assets/fake_data/user_image.png'),
            ),
            SizedBox(width: 10),
            Text(
              blog.author.fullName,
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
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(color: Colors.blueAccent, width: 2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user_cirlce_add_copy,
                color: Colors.blueAccent.shade700,
              ),
              SizedBox(width: 10),
              Text(
                'Follow',
                style: TextStyle(color: Colors.blueAccent.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
