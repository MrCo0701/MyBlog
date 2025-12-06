import 'package:freezed_annotation/freezed_annotation.dart';

part 'writing_state.freezed.dart';

@freezed
class WritingState with _$WritingState {
  const factory WritingState.initial() = _Initial;

  const factory WritingState.loading() = _Loading;

  const factory WritingState.success() = _Success;

  const factory WritingState.error(String message) = _Error;
}
