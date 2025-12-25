import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/setting/presentation/pages/setting_screen.dart';
import 'package:my_blog/features/setting/presentation/widgets/option_setting.dart';


class OptionSettingScreen extends StatelessWidget {
  const OptionSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            OptionSetting(
              title: 'Profile',
              icon: Iconsax.user,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage()),
              ),
            ),
            OptionSetting(
              title: 'Notification Setting',
              icon: Iconsax.notification,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
