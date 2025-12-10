import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/detail/presentation/pages/detail_screen.dart';
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
                          spacing: 5,
                          children: state.allBlogs.map((blog) {
                            return PostCard(
                              blog: blog,
                              image: 'assets/fake_data/image_1.png',
                              onPressMore: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WritingScreen(),
                                  ),
                                );
                              },
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(blog: blog),
                                ),
                              ),
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
