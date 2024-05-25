import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';
import '../notifier/video_notifier.dart';

class VideoPlayerView extends StatefulWidget {
  final Video video;

  VideoPlayerView({required this.video});

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.video.isAsset) {
      _controller = VideoPlayerController.asset(widget.video.path)
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      _controller = VideoPlayerController.network(widget.video.path)
        ..initialize().then((_) {
          setState(() {});
        });
    }
    _controller.addListener(() {
      setState(() {});
    });
    Provider.of<VideoNotifier>(context, listen: false).setController(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title),
      ),
      body: Column(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          VideoProgressIndicator(_controller, allowScrubbing: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10),
                onPressed: () {
                  _controller.seekTo(_controller.value.position - Duration(seconds: 10));
                },
              ),
              IconButton(
                icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: () {
                  _controller.seekTo(_controller.value.position + Duration(seconds: 10));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}