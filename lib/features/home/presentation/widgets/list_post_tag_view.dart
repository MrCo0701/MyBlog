import 'package:flutter/material.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/home/presentation/widgets/post_card.dart';

import '../../../blog_writting/presentation/pages/writing_screen.dart';
import '../../../detail/presentation/pages/detail_screen.dart';

SliverList buildPostList(final List<BlogEntity> listBlogs) {
  return SliverList.builder(
    itemCount: listBlogs.length,
    itemBuilder: (context, index) {
      return SingleChildScrollView(
        child: Column(
          children: listBlogs.map((blog) {
            return PostCard(
              blog: blog,
              image: 'assets/fake_data/image_1.png',
              onPressMore: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WritingScreen()),
                );
              },
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(blog: blog)),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}
