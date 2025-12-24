import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/home/data/models/author/author_model.dart';
import 'package:my_blog/features/series/data/models/count_seri/count_seri.dart';

part 'seri_with_count_model.freezed.dart';
part 'seri_with_count_model.g.dart';

@freezed
abstract class SeriesWithCountModel with _$SeriesWithCountModel {
  const factory SeriesWithCountModel({
    required int id,
    required String title,
    required String description,
    required String slug,
    required String createdAt,
    required AuthorModel author,
    @JsonKey(name: '_count')
    required CountSeriesModel count,
  }) = _SeriesWithCountModel;

  factory SeriesWithCountModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesWithCountModelFromJson(json);
}
