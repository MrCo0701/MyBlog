import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/features/detail/domain/repository/summarize_blog_repository.dart';

class SummarizeBlogRepositoryImpl implements SummarizeBlogRepository {
  @override
  Future<String> summarizeBlog(String content) async {
    final dio = Dio();
    const apiKey = Env.apiKeyAi;

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
}
