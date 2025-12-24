
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_state.freezed.dart';

@freezed
class SeriesState with _$SeriesState{
  const factory SeriesState.initial() = _Initial;
  const factory SeriesState.loading() = _Loading;
  const factory SeriesState.success() = _Success;
  const factory SeriesState.error(String message) = _Error;
}
