import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/detail/domain/use_case/summarize_use_case.dart';
import 'package:my_blog/features/detail/presentation/cubits/summarize_blog/summarize_blog_state.dart';

class SummarizeBlogCubit extends Cubit<SummarizeBlogState> {
  SummarizeBlogCubit(this.useCase)
    : super(
        SummarizeBlogState(content: '', isSummarize: false, isLoading: false),
      );

  final SummarizeUseCase useCase;

  Future<void> summarizeBlog(String content) async {
    emit(state.copyWith(isLoading: true));

    if (state.isSummarize) {
      emit(state.copyWith(content: '', isSummarize: false, isLoading: false));
    } else {
      final blogAfterSummarize = await useCase.summarizeBlog(content);
      emit(
        state.copyWith(
          content: blogAfterSummarize,
          isSummarize: true,
          isLoading: false,
        ),
      );
    }
  }
}
