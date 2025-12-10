import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/detail/domain/entity/comment_entity.dart';

class CommentItem extends StatelessWidget {
  final String idUser;
  final CommentEntity comment;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const CommentItem({
    super.key,
    required this.idUser,
    required this.comment,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final avtUrl = comment.user.avatarUrl;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: avtUrl == '' || avtUrl == null
                    ? AssetImage('assets/fake_data/user_image.png')
                    : NetworkImage(avtUrl),
                radius: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.user.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      comment.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        idUser == comment.user.id
            ? Row(
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: Icon(Iconsax.edit_2_copy),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: Icon(Iconsax.trash_copy),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
