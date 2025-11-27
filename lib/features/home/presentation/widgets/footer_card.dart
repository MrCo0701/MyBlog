import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FooterCard extends StatelessWidget {
  const FooterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Row(
            children: [
              Icon(Iconsax.eye_copy, color: Colors.grey.shade600),
              SizedBox(width: 10),
              Text(
                '1',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 2,
            color: Colors.grey.shade600.withOpacity(0.2),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          ),
          Row(
            children: [
              Icon(Iconsax.arrow_square_copy, color: Colors.grey.shade600),
              SizedBox(width: 10),
              Text(
                '0',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 2,
            color: Colors.grey.shade600.withOpacity(0.2),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          ),
          Row(
            children: [
              Icon(Iconsax.message_2_copy, color: Colors.grey.shade600),
              SizedBox(width: 10),
              Text(
                '0',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 2,
            color: Colors.grey.shade600.withOpacity(0.2),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          ),
          Row(
            children: [
              Icon(Iconsax.bookmark_copy, color: Colors.grey.shade600),
              SizedBox(width: 10),
              Text(
                '0',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
