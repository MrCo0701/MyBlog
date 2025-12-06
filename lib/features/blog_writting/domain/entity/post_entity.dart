class PostEntity {
  final String title;
  final String contentType;
  final List<Map<String, dynamic>> content;
  final String description;
  final String thumbnail;
  final int? seriesId;
  final bool published;
  final int readTime;
  final List<String> tags;

  PostEntity({
    required this.title,
    required this.content,
    required this.contentType,
    required this.description,
    required this.thumbnail,
    this.seriesId,
    required this.published,
    required this.readTime,
    required this.tags,
  });
}
