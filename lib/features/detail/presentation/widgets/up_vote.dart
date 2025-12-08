import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    super.key,
    required this.upVoteAction,
    required this.downVoteAction,
    required this.vote,
    this.isUpvote,
  });

  final VoidCallback upVoteAction;
  final VoidCallback downVoteAction;
  final int? vote;
  final bool? isUpvote;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: GestureDetector(
            onTap: upVoteAction,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.direct_up,
                        color: isUpvote == null || isUpvote == false
                            ? Colors.grey.shade700.withOpacity(0.8)
                            : Colors.blueAccent,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Upvote · $vote",
                        style: TextStyle(
                          color: isUpvote == null || isUpvote == false
                              ? Colors.grey.shade700.withOpacity(0.8)
                              : Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Container(color: Colors.black26, width: 1.5, height: 25),

                  Icon(Iconsax.direct_down, color: Colors.black45),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: downVoteAction,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Iconsax.bookmark_copy, color: Colors.black45),
                  Text(
                    "10",
                    style: TextStyle(
                      color: Colors.grey.shade700.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
