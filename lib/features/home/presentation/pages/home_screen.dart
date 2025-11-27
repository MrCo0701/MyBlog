import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_blog/features/blog_writting/presentation/pages/writing_screen.dart';
import 'package:my_blog/features/home/presentation/pages/test.dart';

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
    final quillController = QuillController.basic();

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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      PostCard(
                        author: "Duy Hảo",
                        time: "43 minutes ago",
                        title: "Giới thiệu về Linux kernel development",
                        description:
                            "Linux ra đời năm 1991 va nhieu lan xuat hien voi tu cach ",
                        tags: ["linux_and_oop", "linux_versioning"],
                        image: 'assets/fake_data/image_1.png',
                        onPressMore: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => WritingScreen()),
                        ),
                      ),
                      PostCard(
                        author: "Duy Hảo",
                        time: "2 minutes ago",
                        title: "Học Flutter thế nào cho chuẩn",
                        description:
                            "Flutter là framework đa nền tảng khá mạnh hiện nay, nhưng việc tiếp thu va học như thế nao",
                        tags: ["flutter", "firebase", "cross-platform"],
                        image: 'assets/fake_data/image_1.png',
                        onPressMore: () {},
                      ),
                      PostCard(
                        author: "Tan Lam",
                        time: "30 minutes ago",
                        title: "Giới thiệu về Linux kernel development",
                        description:
                            "Linux ra đời năm 1991 va nhieu lan xuat hien voi tu cach ",
                        tags: [
                          "johnmadieu",
                          "linux_and_oop",
                          "linux_versioning",
                        ],
                        image: 'assets/fake_data/image_2.png',
                        onPressMore: () {},
                      ),
                    ],
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
