import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/core/storage/token_storage.dart';
import 'package:my_blog/features/series/data/models/seri_detail/seri_detail_model.dart';
import 'package:my_blog/features/series/data/models/series_with_count/seri_with_count_model.dart';
import 'package:my_blog/features/series/presentation/pages/series_detail.dart';

import '../../domain/repository/seri_repository.dart';

class SeriRepositoryImpl implements SeriRepository {
  final dio = Dio();

  @override
  Future<bool> createNewSeri(
    String title,
    String description,
    List<String> postIds,
  ) async {
    final url = Env.baseUrl + ApiConstants.series;
    final accessToken = await TokenStorage.getAccessToken();

    try {
      dio.post(
        url,
        data: {
          "title": title,
          "description": description,
          "thumbnail":
              "https://res.cloudinary.com/demo/image/upload/nestjs-add_series.jpg",
          "postIds": postIds,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      return true;
    } catch (e) {
      print('Error to create Series: $e');
      return false;
    }
  }

  @override
  Future<List<SeriesWithCountModel>> getListSeries() async {
    final url = Env.baseUrl + ApiConstants.series;

    try {
      final response = await dio.get(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final List data = response.data['data']['data'];

      return data.map((e) => SeriesWithCountModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error to get Series: $e');
    }
  }

  @override
  Future<SeriesDetailModel> getDetailSeriesBySlug(String slug) async {
    final url = '${Env.baseUrl}${ApiConstants.series}/$slug';

    try {
      final response = await dio.get(
        url,
        queryParameters: {"slug": slug},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return SeriesDetailModel.fromJson(response.data['data']);
    } catch (e) {
      throw Exception('Error to get series detail: $e');
    }
  }
}
