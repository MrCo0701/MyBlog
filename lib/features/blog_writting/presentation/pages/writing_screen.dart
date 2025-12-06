import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/authentication/presentation/widgets/button_login_custom.dart';
import 'package:my_blog/features/blog_writting/domain/entity/post_entity.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/quill_cubit.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/tag_cubit.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/writing_cubit.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/writing_state.dart';
import 'package:my_blog/features/blog_writting/presentation/di/blog_di.dart';
import 'package:my_blog/features/blog_writting/presentation/widgets/icon_button_custom.dart';
import 'package:my_blog/features/blog_writting/presentation/widgets/tag_input.dart';
import 'package:my_blog/features/blog_writting/presentation/widgets/writing_content.dart';

import '../../../main/presentation/pages/main_container.dart';

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final tagController = TextEditingController();
    final quillController = QuillController.basic();
    List<String> tags = [];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => QuillCubit()),
                    BlocProvider(create: (_) => blogProvider()),
                    BlocProvider(create: (_) => TagCubit()),
                  ],
                  child: BlocConsumer<WritingCubit, WritingState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        loading: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(days: 1),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.blueAccent,
                              content: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    'Uploading...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        success: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green,
                              content: Text(
                                'Upload Success!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          Future.delayed(const Duration(seconds: 2));

                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainContainer(),
                              ),
                            );
                          }
                        },
                        error: (e) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              content: Text(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                e,
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      final quillCubit = context.read<QuillCubit>();

                      void toggleFormat(Attribute attribute) {
                        quillCubit.toggle(quillController, attribute);
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WritingContent(
                              controller: titleController,
                              title: 'Post Title',
                              hintText: 'Enter your title here',
                            ),
                            SizedBox(height: 20),

                            BlocBuilder<TagCubit, List<String>>(
                              builder: (context, state) {
                                return TagInput(
                                  listTags: state,
                                  controller: tagController,
                                  acceptAction: (value) {
                                    context.read<TagCubit>().addTag(value);
                                    tagController.text = '';
                                    tags = state;
                                  },
                                  removeTag: (value) =>
                                      context.read<TagCubit>().removeTag(value),
                                );
                              },
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Post Content',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.25),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          IconButtonCustom(
                                            onPressed: () =>
                                                quillController.undo(),
                                            icon: Iconsax.undo,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () =>
                                                quillController.redo(),
                                            icon: Iconsax.redo,
                                          ),
                                          Container(
                                            width: 1,
                                            height: 30,
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                          ),

                                          IconButtonCustom(
                                            onPressed: () =>
                                                toggleFormat(Attribute.bold),
                                            icon: Iconsax.text_bold,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () =>
                                                toggleFormat(Attribute.italic),
                                            icon: Iconsax.text_italic,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.strikeThrough,
                                            ),
                                            icon: Iconsax.text_block,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          IconButtonCustom(
                                            onPressed: () =>
                                                toggleFormat(Attribute.h1),
                                            icon: Iconsax.code_1,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.blockQuote,
                                            ),
                                            icon: Iconsax.quote_down,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () =>
                                                toggleFormat(Attribute.ul),
                                            icon: Iconsax.textalign_left,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () =>
                                                toggleFormat(Attribute.ol),
                                            icon: Iconsax.check,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () {},
                                            icon: Iconsax.grid_2,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () =>
                                                toggleFormat(Attribute.h1),
                                            icon: Iconsax.minus,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          IconButtonCustom(
                                            onPressed: () {},
                                            icon: Iconsax.link_1,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () {},
                                            icon: Iconsax.gallery,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.codeBlock,
                                            ),
                                            icon: Iconsax.code_circle,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.leftAlignment,
                                            ),
                                            icon: Iconsax.textalign_left,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.centerAlignment,
                                            ),
                                            icon: Iconsax.textalign_center,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.rightAlignment,
                                            ),
                                            icon: Iconsax.textalign_right,
                                          ),
                                          IconButtonCustom(
                                            onPressed: () => toggleFormat(
                                              Attribute.justifyAlignment,
                                            ),
                                            icon:
                                                Iconsax.textalign_justifycenter,
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10),
                                    Divider(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                    SizedBox(height: 20),

                                    Expanded(
                                      child: QuillEditor(
                                        focusNode: FocusNode(),
                                        scrollController: ScrollController(),
                                        controller: quillController,
                                        // autoFocus: true,
                                        // expands: true,
                                        // padding: EdgeInsets.zero,
                                        // scrollable: true,
                                        // placeholder: 'Compose your post here',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ButtonLoginCustom(
                              text: 'Publish Post',
                              onPress: () {
                                final content = quillController.document
                                    .toDelta()
                                    .toJson();

                                final post = PostEntity(
                                  title: titleController.text,
                                  contentType: "QUILL_DELTA",
                                  content: content,
                                  description: 'something',
                                  thumbnail:
                                      'https://example.com/images/clean-arch-banner.jpg',
                                  seriesId: 0,
                                  published: true,
                                  readTime: 5,
                                  tags: tags,
                                );

                                context.read<WritingCubit>().uploadBlog(post);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
