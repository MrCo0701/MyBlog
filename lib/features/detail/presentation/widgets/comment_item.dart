import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String content;
  final int vote;

  const CommentItem({
    required this.avatarUrl,
    required this.name,
    required this.content,
    required this.vote,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(avatarUrl), radius: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(content),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.arrow_upward, size: 16),
                  const SizedBox(width: 4),
                  Text(vote.toString()),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_downward, size: 16),
                  const SizedBox(width: 12),
                  const Icon(Icons.reply, size: 16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
