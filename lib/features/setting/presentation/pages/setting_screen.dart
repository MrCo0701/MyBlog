import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/authentication/presentation/pages/login_screen.dart';
import 'package:my_blog/features/setting/presentation/cubits/setting_cubit.dart';
import 'package:my_blog/features/setting/presentation/cubits/setting_state.dart';
import 'package:my_blog/features/setting/presentation/di/setting_di.dart';
import 'package:my_blog/features/setting/presentation/widgets/setting_header.dart';

import '../../../detail/presentation/pages/detail_screen.dart';
import '../../../detail/presentation/widgets/dia_log_delete_comment.dart';
import '../../../home/presentation/widgets/post_card.dart';
import '../widgets/update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ["Posts", "Series"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => settingProvider()
        ..getUserInfo()
        ..getBlogsById(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                          icon: Icon(Icons.logout, color: Colors.red),
                          onPressed: () => showDeleteCommentDialog(
                            context,
                            onConfirm: () {
                              context.read<SettingCubit>().logout();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            title: 'Logout',
                            description: 'Are you sure to logout ?',
                          ),
                        ),
                      ),
                    ],
                    expandedHeight: 350,
                    pinned: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.black),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: SettingHeader(
                        userInfo: state.userInfo,
                        changeProfile: () => showUpdateProfileDialog(
                          context,
                          imageUrl: state.userInfo.avatarUrl,
                          currentName: state.userInfo.fullName,
                          currentAvatar: state.fileImage,
                          onSave: () => {
                            // print(state.fileImage),
                            // context.read<SettingCubit>().changeUserInfo(
                            //   state.fileImage,
                            //   state.userInfo.fullName,
                            // ),
                          },
                        ),
                      ),
                    ),

                    // bottom: PreferredSize(
                    //   preferredSize: const Size.fromHeight(48),
                    //   child: Container(
                    //     color: Colors.white,
                    //     child: TabBar(
                    //       controller: _tabController,
                    //       labelPadding: EdgeInsets.only(right: 20),
                    //       indicatorPadding: EdgeInsets.zero,
                    //       isScrollable: false,
                    //       indicatorSize: TabBarIndicatorSize.tab,
                    //       indicatorColor: Colors.blue,
                    //       labelColor: Colors.blue,
                    //       unselectedLabelColor: Colors.grey.shade600,
                    //       labelStyle: const TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 16,
                    //       ),
                    //       tabs: tabs.map((t) => Tab(text: t)).toList(),
                    //     ),
                    //   ),
                    // ),
                  ),
                ];
              },

              body: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 5,
                    children: state.blogs.map((blog) {
                      return PostCard(
                        blog: blog,
                        image: blog.author.avatarUrl ?? '',
                        onPressMore: () {},
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(blog: blog),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
