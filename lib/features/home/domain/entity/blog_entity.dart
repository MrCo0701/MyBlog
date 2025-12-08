import 'package:my_blog/features/home/data/models/tag/tag_model.dart';

import '../../data/models/quill/quill_model.dart';
import 'author_entity.dart';

class BlogEntity {
  final String id;
  final String title;
  final List<DeltaOpModel> content;
  final bool published;
  final List<TagModel> tags;
  final int readTime;
  final int viewCount;
  final int totalUpvotes;
  final bool isUpvoted;
  final String? createdAt;
  final AuthorEntity author;

  BlogEntity({
    required this.id,
    required this.title,
    required this.isUpvoted,
    required this.totalUpvotes,
    required this.tags,
    required this.content,
    required this.published,
    required this.readTime,
    required this.viewCount,
    required this.createdAt,
    required this.author,
  });
}
