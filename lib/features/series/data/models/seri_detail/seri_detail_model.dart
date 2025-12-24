import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/home/data/models/author/author_model.dart';
import 'package:my_blog/features/home/data/models/blog/blog_model.dart';

part 'seri_detail_model.freezed.dart';
part 'seri_detail_model.g.dart';

@freezed
abstract class SeriesDetailModel with _$SeriesDetailModel {
  const factory SeriesDetailModel({
    required int id,
    required String title,
    required String slug,
    required String description,
    required String createdAt,
    required AuthorModel author,
    required List<BlogModel> posts,
  }) = _SeriesDetailModel;

  factory SeriesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailModelFromJson(json);
}
