import 'package:my_blog/features/series/data/models/seri_detail/seri_detail_model.dart';
import 'package:my_blog/features/series/data/models/series_with_count/seri_with_count_model.dart';
import 'package:my_blog/features/series/domain/repository/seri_repository.dart';
import 'package:my_blog/features/series/presentation/pages/series_detail.dart';

class SeriUseCase {
  final SeriRepository repository;

  SeriUseCase({required this.repository});

  Future<bool> createNewSeri(
    String title,
    String description,
    List<String> postIds,
  ) async {
    return repository.createNewSeri(title, description, postIds);
  }

  Future<List<SeriesWithCountModel>> getListSeries() async {
    return repository.getListSeries();
  }

  Future<SeriesDetailModel> getSeriesBySlug(String slug) async {
    return repository.getDetailSeriesBySlug(slug);
  }
}
