import 'package:flutter/material.dart';
import 'package:my_blog/features/setting/domain/entity/user_info_entity.dart';

import '../../../home/presentation/widgets/tag_info.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({
    super.key,
    required this.userInfo,
    required this.changeProfile,
  });

  final UserInfoEntity userInfo;
  final VoidCallback changeProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.only(top: 80),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: changeProfile,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: userInfo.avatarUrl == null
                      ? AssetImage('assets/fake_data/user_image.png')
                      : NetworkImage(userInfo.avatarUrl!),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userInfo.fullName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(userInfo.email, style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TagInfo(
                label: 'posts',
                value: userInfo.stats.postsCount.toString(),
              ),
              TagInfo(
                label: 'series',
                value: userInfo.stats.seriesCount.toString(),
              ),
            ],
          ),

          const SizedBox(height: 15),
          TextButton(
            onPressed: changeProfile,
            child: Text(
              "Setting information",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black26,
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
