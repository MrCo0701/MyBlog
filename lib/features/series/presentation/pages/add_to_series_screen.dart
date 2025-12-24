import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/series/presentation/cubits/select_post/select_post_cubit.dart';
import 'package:my_blog/features/series/presentation/cubits/select_post/select_post_state.dart';
import 'package:my_blog/features/setting/presentation/cubits/setting_cubit.dart';
import 'package:my_blog/features/setting/presentation/cubits/setting_state.dart';

import '../../../detail/presentation/pages/detail_screen.dart';
import '../../../home/presentation/widgets/post_card.dart';

class AddPostToSeriesScreen extends StatelessWidget {
  const AddPostToSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text('Accept', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return state.blogs == []
              ? Center(child: CircularProgressIndicator())
              : Column(
                  spacing: 5,
                  children: state.blogs.map((blog) {
                    return BlocBuilder<SelectPostCubit, SelectPostState>(
                      builder: (context, selectPost) {
                        return PostCard(
                          blog: blog,
                          image: blog.author.avatarUrl ?? '',
                          iconSelected: selectPost.listPostId.contains(blog.id)
                              ? Iconsax.tick_circle
                              : null,
                          onPressMore: () {},
                          onPressed: () => context
                              .read<SelectPostCubit>()
                              .toggleSelection(blog.id),
                        );
                      },
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}
