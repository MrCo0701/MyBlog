class SummarizeBlogState {
  final String content;
  final bool isSummarize;
  final bool isLoading;

  SummarizeBlogState({
    required this.content,
    required this.isSummarize,
    required this.isLoading,
  });

  SummarizeBlogState copyWith({
    String? content,
    bool? isSummarize,
    bool? isLoading,
  }) {
    return SummarizeBlogState(
      content: content ?? this.content,
      isSummarize: isSummarize ?? this.isSummarize,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
