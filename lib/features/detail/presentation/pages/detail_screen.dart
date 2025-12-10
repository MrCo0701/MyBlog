import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_blog/core/utils/delta_converter.dart';
import 'package:my_blog/features/detail/data/repository/detail_repositoy_impl.dart';
import 'package:my_blog/features/detail/presentation/cubits/detail_cubit.dart';
import 'package:my_blog/features/detail/presentation/cubits/detail_state.dart';
import 'package:my_blog/features/detail/presentation/di/detail_di.dart';
import 'package:my_blog/features/detail/presentation/widgets/dia_log_delete_comment.dart';
import 'package:my_blog/features/detail/presentation/widgets/information_detail.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/comment_item.dart';
import '../widgets/comment_text_field.dart';
import '../widgets/up_vote.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.blog});

  final BlogEntity blog;

  @override
  Widget build(BuildContext context) {
    final controller = QuillController(
      document: deltaToDocument(blog.content),
      selection: const TextSelection.collapsed(offset: 0),
    );

    final commentController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(Icons.share_rounded),
              onPressed: () => DetailRepositoryImpl().showAllComments(blog.id),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //* Avatar and name
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/fake_data/image_1.png',
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            blog.author.fullName,
                            style: TextStyle(
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      //* Follow button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: BorderSide(
                              color: Colors.blueAccent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.user_cirlce_add_copy,
                              color: Colors.blueAccent.shade700,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.blueAccent.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  InformationDetail(
                    time: formatDate(blog.createdAt.toString()),
                    views: blog.viewCount,
                    timeRead: blog.readTime,
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 1.5,
                    color: Colors.grey.shade700.withOpacity(0.2),
                  ),
                ],
              ),

              SizedBox(height: 20),
              //*Quill
              QuillEditor.basic(
                controller: controller,
                focusNode: FocusNode(),
                scrollController: ScrollController(),
              ),

              SizedBox(height: 20),
              //* Tags
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    children: blog.tags.map((t) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE7FF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          t.name,
                          style: const TextStyle(
                            color: Color(0xFF7C4DFF),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20),
                  BlocProvider(
                    create: (_) => detailProvider()
                      ..isUpVote(blog.id)
                      ..getAllComments(blog.id),
                    child: BlocBuilder<DetailCubit, DetailState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ActionBar(
                              isUpvote: state.isUpVoted,
                              vote: state.totalUpVotes,
                              upVoteAction: () =>
                                  context.read<DetailCubit>().upVote(blog.id),
                              downVoteAction: () => {},
                            ),
                            const SizedBox(height: 20),
                            InputCustom(
                              controller: commentController,
                              onPressed: () {
                                context.read<DetailCubit>().createComment(
                                  commentController.text,
                                  blog.id,
                                );
                                commentController.text = '';
                              },
                              hintText: 'Write a comment',
                              icon: Iconsax.send_1,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              color: Colors.black26,
                              height: 1,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Comments",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: state.listComments
                                  .map(
                                    (comment) => Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: CommentItem(
                                            idUser: state.idUser,
                                            comment: comment,
                                            onDelete: () =>
                                                showDeleteCommentDialog(
                                                  context,
                                                  onConfirm: () {},
                                                ),
                                            onEdit: () {},
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          width: double.infinity,
                                          height: 1,
                                          color: Colors.black12.withOpacity(
                                            0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDate(String isoString) {
  final dateTime = DateTime.parse(isoString).toLocal();

  return DateFormat('dd MMM yyyy').format(dateTime);
}
