import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:my_blog/core/utils/delta_converter.dart';
import 'package:my_blog/features/home/data/repository/home_repo_impl.dart';
import 'package:my_blog/features/home/domain/di/home_di.dart';
import 'package:my_blog/features/home/presentation/cubits/home_cubit.dart';
import 'package:my_blog/features/home/presentation/cubits/home_state.dart';

import '../../../blog_writting/presentation/pages/writing_screen.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ["Newest", "Following", "Trending", "Editor's Choice"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          TabBar(
            controller: _tabController,
            labelPadding: EdgeInsets.only(right: 20),
            indicatorPadding: EdgeInsets.zero,
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            tabs: tabs.map((t) => Tab(text: t)).toList(),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((t) {
                return BlocProvider(
                  create: (_) => homeProvider()..showAllBlog(),
                  child: SingleChildScrollView(
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return Column(
                          children: state.allBlogs.map((blog) {
                            return PostCard(
                              author: blog.author.fullName,
                              time: "43 minutes ago",
                              title: blog.title,
                              description: deltaToPlainText(blog.content),
                              tags: blog.tags,
                              image: 'assets/fake_data/image_1.png',
                              onPressMore: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WritingScreen(),
                                  ),
                                );
                              },
                              viewCount: blog.viewCount,
                              readCount: 0,
                              commentCount: 0,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
