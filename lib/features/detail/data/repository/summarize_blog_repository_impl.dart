import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/features/detail/domain/repository/summarize_blog_repository.dart';

import '../../../../core/storage/token_storage.dart';

class SummarizeBlogRepositoryImpl implements SummarizeBlogRepository {
  final dio = Dio();

  @override
  Future<String> summarizeBlog(String content) async {
    final apiKey = await getApiKeyGemini();

    final response = await dio.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey',
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": "Hãy tóm tắt bài viết sau:\n$content"},
            ],
          },
        ],
      },
    );

    final summary =
        response.data['candidates'][0]['content']['parts'][0]['text'];

    print(summary);
    return summary;
  }

  Future<String> getApiKeyGemini() async {
    final url = Env.baseUrl + ApiConstants.apiGemini;
    final token = await TokenStorage.getAccessToken();

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data['data']['apiKey'];
    } catch (e) {
      throw Exception('Error to get Api Gemini: $e');
    }
  }
}
