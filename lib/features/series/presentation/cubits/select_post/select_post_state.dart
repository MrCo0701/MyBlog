class SelectPostState {
  final List<String> listPostId;

  SelectPostState({required this.listPostId});

  SelectPostState copyWith({List<String>? selectedIds}) {
    return SelectPostState(listPostId: selectedIds ?? listPostId);
  }
}
