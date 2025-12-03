import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/authentication/presentation/widgets/button_login_custom.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/quill_cubit.dart';
import 'package:my_blog/features/blog_writting/presentation/widgets/icon_button_custom.dart';
import 'package:my_blog/features/blog_writting/presentation/widgets/writing_content.dart';

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final quillController = QuillController.basic();

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
                child: BlocProvider(
                  create: (_) => QuillCubit(),
                  child: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WritingContent(
                              controller: textController,
                              title: 'Post Title',
                              hintText: 'Enter your title here',
                            ),
                            SizedBox(height: 20),

                            WritingContent(
                              controller: textController,
                              title: 'Post Tag',
                              hintText:
                                  'Tag your post . Maximum 5 tags, at least 1 tag',
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
                                    //* Attribute
                                    Row(
                                      children: [
                                        IconButtonCustom(
                                          onPressed: () =>
                                              context.read<QuillCubit>().toggle(
                                                quillController,
                                                Attribute.bold,
                                              ),
                                          icon: Iconsax.text_bold_copy,
                                        ),
                                        IconButtonCustom(
                                          onPressed: () =>
                                              context.read<QuillCubit>().toggle(
                                                quillController,
                                                Attribute.h1,
                                              ),
                                          icon: Iconsax.text_bold_copy,
                                        ),
                                      ],
                                    ),

                                    //* Quill
                                    QuillEditor(
                                      focusNode: FocusNode(),
                                      scrollController: ScrollController(),
                                      controller: quillController,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            ButtonLoginCustom(
                              text: 'Publish Post',
                              onPress: () {},
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
