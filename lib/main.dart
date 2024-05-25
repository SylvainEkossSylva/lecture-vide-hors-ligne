import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_view.dart';
import 'notifier/video_notifier.dart';

void main() {
  runApp(VideoPlayerApp());
}

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lecteur Vidéo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
