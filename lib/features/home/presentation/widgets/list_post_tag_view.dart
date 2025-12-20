import 'package:flutter/material.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/home/presentation/widgets/post_card.dart';

import '../../../detail/presentation/pages/detail_screen.dart';

SliverList buildPostList(final List<BlogEntity> listBlogs) {
  return SliverList.builder(
    itemCount: listBlogs.length,
    itemBuilder: (context, index) {
      final blog = listBlogs[index];

      return PostCard(
        blog: blog,
        image: blog.author.avatarUrl ?? '',
        onPressMore: () {},
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(blog: blog)),
        ),
      );
    },
  );
}
