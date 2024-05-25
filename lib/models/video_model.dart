class Video {
  String title;
  final String path;
  final Duration duration;
  final String thumbnail;
  final bool isAsset;

  Video({
    required this.title,
    required this.path,
    required this.duration,
    required this.thumbnail,
    this.isAsset = false,
  });
}