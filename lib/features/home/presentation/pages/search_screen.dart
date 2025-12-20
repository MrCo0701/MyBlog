import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/detail/presentation/widgets/comment_text_field.dart';
import 'package:my_blog/features/home/data/repository/home_repo_impl.dart';
import 'package:my_blog/features/home/domain/di/home_di.dart';

import '../../../blog_writting/presentation/pages/writing_screen.dart';
import '../../../detail/presentation/pages/detail_screen.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import '../widgets/post_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //* Search bar
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputCustom(
                    controller: searchController,
                    onPressed: () => context.read<HomeCubit>().searchBlog(
                      searchController.text,
                    ),
                    hintText: 'Search here',
                    icon: Iconsax.search_normal_copy,
                  ),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: state.allBlogs.map((blog) {
                    return PostCard(
                      blog: blog,
                      image: blog.author.avatarUrl ?? '',
                      onPressMore: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => WritingScreen()),
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
        ],
      ),
    );
  }
}
