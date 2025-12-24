import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/core/utils/date_fomartter.dart';
import 'package:my_blog/features/detail/data/repository/detail_repositoy_impl.dart';
import 'package:my_blog/features/detail/presentation/cubits/follow/follow_cubit.dart';
import 'package:my_blog/features/detail/presentation/cubits/follow/follow_state.dart';
import 'package:my_blog/features/detail/presentation/di/following_di.dart';
import 'package:my_blog/features/detail/presentation/widgets/information_detail.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/series/presentation/cubits/get_series/get_series_cubit.dart';
import 'package:my_blog/features/series/presentation/cubits/get_series/get_series_state.dart';
import 'package:my_blog/features/series/presentation/di/get_series_di.dart';

import '../../../detail/presentation/pages/detail_screen.dart';
import '../../../detail/presentation/widgets/info_user_detail.dart';
import '../../../home/presentation/widgets/post_card.dart';

class SeriesDetail extends StatelessWidget {
  const SeriesDetail({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        //     child: IconButton(
        //       icon: Icon(Icons.share_rounded),
        //       onPressed: () => DetailRepositoryImpl().showAllComments(blog.id),
        //     ),
        //   ),
        // ],
      ),
      body: BlocProvider(
        create: (_) => getSeriesProvider()..getSeriesDetail(slug),
        child: BlocBuilder<GetSeriesCubit, GetSeriesState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.seriesDetail.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 20),

                        BlocProvider(
                          create: (_) => followProvider()
                            ..checkFollowAuthor(state.seriesDetail.author.id),
                          child: BlocBuilder<FollowCubit, FollowState>(
                            builder: (context, followState) {
                              return InformationUserDetail(
                                author: state.seriesDetail.author.toEntity(),
                                followAction: () =>
                                    context.read<FollowCubit>().followUser(
                                      state.seriesDetail.author.id,
                                      !followState.isFollowing,
                                    ),
                                isFollowing: followState.isFollowing,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        InformationBlogDetail(
                          time: DateFormatter.formatDate(
                            state.seriesDetail.createdAt.toString(),
                          ),
                          views: 0,
                          countOfPosts: state.seriesDetail.posts.length,
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 1.5,
                          color: Colors.grey.shade700.withOpacity(0.2),
                        ),
                      ],
                    ),
                    Text(
                      state.seriesDetail.description,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Posts in series',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      spacing: 5,
                      children: state.seriesDetail.posts.map((post) {
                        return PostCard(
                          blog: post.toEntity(),
                          image: post.author.avatarUrl ?? '',
                          onPressMore: () {},
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailScreen(blog: post.toEntity()),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
