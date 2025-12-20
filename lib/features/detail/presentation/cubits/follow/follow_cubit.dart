import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blog/features/detail/domain/use_case/detail_use_case.dart';
import 'package:my_blog/features/detail/presentation/cubits/follow/follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  FollowCubit(this.useCase) : super(FollowState());

  final DetailUseCase useCase;

  Future<void> followUser(String idUser, bool isFollow) async {
    final isFollowSuccess = await useCase.followUser(idUser, isFollow);
    emit(state.copyWith(isFollowing: isFollowSuccess));
  }

  Future<void> checkFollowAuthor(String idUser) async {
    final isFollowing = await useCase.isFollowThisAuthor(idUser);
    emit(state.copyWith(isFollowing: isFollowing));
  }
}
