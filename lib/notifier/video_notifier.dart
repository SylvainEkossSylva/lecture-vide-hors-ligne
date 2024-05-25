import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';

class VideoNotifier extends ChangeNotifier {
  List<Video> _videos = [];
  VideoPlayerController? _controller;

  List<Video> get videos => _videos;
  VideoPlayerController? get controller => _controller;

  void loadVideos(List<Video> videos) {
    _videos = videos;
    notifyListeners();
  }

  Future<void> loadAssetVideos() async {
    List<Video> assetVideos = [];
    for (int i = 1; i <= 20; i++) {
      String path = 'assets/videos/video$i.mp4';
      String thumbnail = 'assets/images/thumbnail$i.png';
      Duration duration = Duration(minutes: 2 + i);
      assetVideos.add(Video(
        title: 'Video $i',
        path: path,
        duration: duration,
        thumbnail: thumbnail,
        isAsset: true,
      ));
    }
    _videos.addAll(assetVideos);
    notifyListeners();
  }

  void setController(VideoPlayerController controller) {
    _controller = controller;
    notifyListeners();
  }

  void addVideo(Video video) {
    _videos.add(video);
    notifyListeners();
  }

  void renameVideo(Video video, String newTitle) {
    video.title = newTitle;
    notifyListeners();
  }

  void deleteVideo(Video video) {
    _videos.remove(video);
    notifyListeners();
  }

  void shareVideo(Video video) {
    // Implémentation du partage de la vidéo
  }
}
