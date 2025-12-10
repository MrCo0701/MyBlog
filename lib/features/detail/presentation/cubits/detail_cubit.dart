import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/detail/domain/use_case/detail_use_case.dart';
import 'package:my_blog/features/detail/presentation/cubits/detail_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this.useCase) : super(DetailState());

  final DetailUseCase useCase;

  Future<void> upVote(String idBlog) async {
    final upVote = await useCase.upVote(idBlog);
    emit(
      state.copyWith(
        totalUpVotes: upVote.totalVote,
        isUpVoted: upVote.isUpVoted,
      ),
    );
  }

  Future<void> isUpVote(String idBlog) async {
    await useCase.upVote(idBlog);
    final upVote = await useCase.upVote(idBlog);
    emit(
      state.copyWith(
        totalUpVotes: upVote.totalVote,
        isUpVoted: upVote.isUpVoted,
      ),
    );
  }

  Future<void> createComment(String comment, String idPost) async {
    await useCase.createComment(comment, idPost);
    getAllComments(idPost);
  }

  Future<void> getAllComments(String idPost) async {
    final listComments = await useCase.getAllComments(idPost);
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('idUser');

    emit(state.copyWith(listComments: listComments, idUser: idUser ?? ''));
  }

  Future<void> deleteComment(String idComment, String idPost) async {
    await useCase.deleteComment(idComment);
    final listComments = await useCase.getAllComments(idPost);

    emit(state.copyWith(listComments: listComments));
  }

  Future<void> updateComment(
    String idComment,
    String content,
    String idPost,
  ) async {
    await useCase.updateComment(idComment, content, idPost);
    final listComments = await useCase.getAllComments(idPost);

    emit(state.copyWith(listComments: listComments));
  }
}
