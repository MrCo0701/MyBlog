import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/detail/presentation/widgets/information_detail.dart';
import 'package:flutter_quill/flutter_quill.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.controller});

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Icon(Icons.share_rounded),
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
                children: [
                  Text(
                    'Flutter: Nen tang lap trinh da nen tang toi uu nhat hien nay voi nhieu cong cu ho tro',
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
                            'Duy Hao',
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
                    time: '23 Nov 2025',
                    views: 23,
                    timeRead: 46,
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
              QuillEditor.basic(
                controller: controller,
                focusNode: FocusNode(),
                scrollController: ScrollController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
