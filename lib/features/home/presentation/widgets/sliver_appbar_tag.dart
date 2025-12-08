import 'package:flutter/material.dart';
import 'package:my_blog/features/home/presentation/widgets/tag_header.dart';

SliverAppBar buildHeader(int postsCount, String nameTag) {
  return SliverAppBar(
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    pinned: true,
    expandedHeight: 260,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: SizedBox(),
    flexibleSpace: LayoutBuilder(
      builder: (context, constraints) {
        final top = constraints.biggest.height;

        double percent = (top - kToolbarHeight) / (260 - kToolbarHeight);
        percent = percent.clamp(0.0, 1.0);

        return FlexibleSpaceBar(
          background: TagHeader(
            percent: percent,
            nameTag: nameTag,
            postsCount: postsCount,
          ),
        );
      },
    ),
  );
}
