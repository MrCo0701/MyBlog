import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/blog_writting/domain/entity/post_entity.dart';
import 'package:my_blog/features/blog_writting/domain/use_case/blog_use_case.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/writing_state.dart';

class WritingCubit extends Cubit<WritingState> {
  WritingCubit(this.useCase) : super(WritingState.initial());

  final BlogUseCase useCase;

  Future<void> uploadBlog(PostEntity post) async {
    emit(WritingState.loading());

    final isUploadSuccess = await useCase.uploadBlog(post);
    if (isUploadSuccess) {
      emit(WritingState.success());
    } else {
      emit(WritingState.error('Upload fail'));
    }
  }
}
