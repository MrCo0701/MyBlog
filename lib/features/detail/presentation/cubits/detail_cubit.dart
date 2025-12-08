import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/detail/domain/use_case/detail_use_case.dart';
import 'package:my_blog/features/detail/presentation/cubits/detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this.useCase)
    : super(DetailState(isUpVoted: false, totalUpVotes: 0));

  final DetailUseCase useCase;

  Future<void> upVote(String idBlog) async {
    final upVote = await useCase.upVote(idBlog);
    emit(
      DetailState(isUpVoted: upVote.isUpVoted, totalUpVotes: upVote.totalVote),
    );
  }

  Future<void> isUpVote(String idBlog) async {
    await useCase.upVote(idBlog);
    final upVote = await useCase.upVote(idBlog);
    emit(
      DetailState(isUpVoted: upVote.isUpVoted, totalUpVotes: upVote.totalVote),
    );
  }
}
