import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/series/data/models/seri_detail/seri_detail_model.dart';
import 'package:my_blog/features/series/data/models/series_with_count/seri_with_count_model.dart';

part 'get_series_state.freezed.dart';

@freezed
abstract class GetSeriesState with _$GetSeriesState {
  const factory GetSeriesState({
    required List<SeriesWithCountModel> listSeries,
    required SeriesDetailModel seriesDetail,
  }) = _GetSeriesState;
}
