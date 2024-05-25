import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifier/video_notifier.dart';
import '../components/video_list_item.dart';
import 'video_player_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<VideoNotifier>(context, listen: false).loadAssetVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecteur Vidéo'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implémenter la recherche de vidéos
            },
          ),
          IconButton(
            icon: Icon(Icons.cloud_download),
            onPressed: () {
              // Implémenter la navigation vers les vidéos téléchargées
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implémenter la navigation vers les options en ligne ou locales
            },
          ),
        ],
      ),
      body: Consumer<VideoNotifier>(
        builder: (context, notifier, child) {
          return ListView.builder(
            itemCount: notifier.videos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerView(video: notifier.videos[index]),
                    ),
                  );
                },
                child: VideoListItem(video: notifier.videos[index]),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Local'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Tendance'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: 'Moments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (index) {
          // Implémenter la navigation
        },
      ),
    );
  }
}
