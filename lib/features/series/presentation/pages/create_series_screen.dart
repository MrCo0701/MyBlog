import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:my_blog/features/authentication/presentation/widgets/button_login_custom.dart';
import 'package:my_blog/features/series/data/repository/seri_repository_impl.dart';
import 'package:my_blog/features/series/presentation/cubits/select_post/select_post_cubit.dart';
import 'package:my_blog/features/series/presentation/cubits/select_post/select_post_state.dart';
import 'package:my_blog/features/series/presentation/di/series_di.dart';
import 'package:my_blog/features/series/presentation/pages/add_to_series_screen.dart';
import 'package:my_blog/features/setting/presentation/di/setting_di.dart';

import '../../../blog_writting/presentation/widgets/writing_content.dart';
import '../../../main/presentation/pages/main_container.dart';
import '../cubits/add_series/series_cubit.dart';
import '../cubits/add_series/series_state.dart';

class AddSeriesScreen extends StatelessWidget {
  const AddSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => seriesProvider()),
        BlocProvider(create: (_) => SelectPostCubit()),
      ],
      child: BlocConsumer<SeriesCubit, SeriesState>(
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
                        'Creating...',
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
                    'Create Seri Success!',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  duration: Duration(seconds: 2),
                ),
              );

              Future.delayed(const Duration(seconds: 2));

              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainContainer()),
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    e,
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          );
        },
        builder: (context, seriState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Builder(
                  builder: (innerContext) {
                    return IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return MultiBlocProvider(
                              providers: [
                                BlocProvider.value(
                                  value: innerContext.read<SelectPostCubit>(),
                                ),
                                BlocProvider(
                                  create: (_) =>
                                      settingProvider()..getBlogsById(),
                                ),
                              ],
                              child: AddPostToSeriesScreen(),
                            );
                          },
                        ),
                      ),
                      icon: Icon(
                        Iconsax.document_upload,
                        color: Colors.blueAccent,
                      ),
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<SelectPostCubit, SelectPostState>(
                  builder: (context, state) {
                    return Column(
                      spacing: 20,
                      children: [
                        WritingContent(
                          controller: titleController,
                          title: 'Seri Title',
                          hintText: 'Enter your title here',
                        ),
                        WritingContent(
                          maxLine: 10,
                          controller: descriptionController,
                          title: 'Seri Description',
                          hintText: 'Enter your description here',
                        ),
                        ButtonLoginCustom(
                          text: 'Publish Seri',
                          onPress: () =>
                              context.read<SeriesCubit>().createNewSeri(
                                titleController.text,
                                descriptionController.text,
                                state.listPostId,
                              ),
                        ),
                        DottedBorder(
                          color: Colors.blue,
                          strokeWidth: 1.5,
                          dashPattern: const [6, 4],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.article_outlined,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${state.listPostId.length} Posts Is Selected',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
