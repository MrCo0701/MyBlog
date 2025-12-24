import 'package:my_blog/features/series/data/models/seri_detail/seri_detail_model.dart';
import 'package:my_blog/features/series/data/models/series_with_count/seri_with_count_model.dart';
import 'package:my_blog/features/series/presentation/pages/series_detail.dart';

abstract class SeriRepository {
  Future<bool> createNewSeri(
    String title,
    String description,
    List<String> postIds,
  );

  Future<List<SeriesWithCountModel>> getListSeries();

  Future<SeriesDetailModel> getDetailSeriesBySlug(String slug);
}
