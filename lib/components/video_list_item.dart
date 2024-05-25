import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoListItem extends StatelessWidget {
  final Video video;

  VideoListItem({required this.video});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(video.thumbnail, width: 50, height: 50),
      title: Text(video.title),
      subtitle: Text(_formatDuration(video.duration)),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          // Gérer les options du menu contextuel
        },
        itemBuilder: (BuildContext context) {
          return {'Partager', 'Renommer', 'Masquer', 'Supprimer'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
      onTap: () {
        // Naviguer vers la vue de lecture vidéo
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}