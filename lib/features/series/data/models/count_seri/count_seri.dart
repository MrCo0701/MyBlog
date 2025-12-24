import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_seri.freezed.dart';

part 'count_seri.g.dart';

@freezed
abstract class CountSeriesModel with _$CountSeriesModel {
  const factory CountSeriesModel({required int posts}) = _CountSeriesModel;

  factory CountSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountSeriesModelFromJson(json);
}
