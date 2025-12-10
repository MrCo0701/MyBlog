import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/comment_entity.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    @Default(false) bool isUpVoted,
    @Default(0) int totalUpVotes,
    @Default([]) List<CommentEntity> listComments,
    @Default('') String idUser,
  }) = _DetailState;
}
