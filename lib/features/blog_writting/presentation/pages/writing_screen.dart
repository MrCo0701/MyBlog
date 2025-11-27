import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_blog/features/authentication/presentation/widgets/button_login_custom.dart';
import 'package:my_blog/features/authentication/presentation/widgets/text_field_login.dart';

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldLogin(
                title: 'Post Title',
                hintText: 'Enter your title here',
                controller: textController,
              ),
              SizedBox(height: 20),
              TextFieldLogin(
                title: 'Post Tag',
                hintText: 'Tag your post. Maximum 5 tags, at least 1 tag',
                controller: textController,
              ),
              SizedBox(height: 20),
              Text(
                'Post Content',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10),
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
                      Container(
                        child: Row(
                          children: [

                          ],
                        ),
                      ),
                      QuillEditor(
                        focusNode: FocusNode(),
                        scrollController: ScrollController(),
                        controller: QuillController.basic(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ButtonLoginCustom(text: 'Publish Post', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
