import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/home/domain/di/home_di.dart';
import 'package:my_blog/features/home/presentation/cubits/home_cubit.dart';
import 'package:my_blog/features/home/presentation/cubits/home_state.dart';

import '../widgets/list_post_tag_view.dart';
import '../widgets/sliver_appbar_tag.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: BlocProvider(
        create: (_) => homeProvider()..searchBlogByTag(tag),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [buildHeader(state.allBlogs.length, tag), buildPostList(state.allBlogs)],
              );
            },
          ),
        ),
      ),
    );
  }
}
