import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late List<String> videoUrls = [
    'https://www.example.com/video1.mp4',
    'https://www.example.com/video2.mp4',
    'https://www.example.com/video3.mp4',
    'https://www.example.com/video4.mp4',
    'https://www.example.com/video5.mp4',
  ];

  late List<ChewieController> chewieControllers;

  @override
  void initState() {
    super.initState();
    chewieControllers = List.generate(
      videoUrls.length,
          (index) => _initializeChewieController(VideoPlayerController.network(videoUrls[index])),
    );
  }

  ChewieController _initializeChewieController(VideoPlayerController videoPlayerController) {
    return ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      // Other options can be set as needed
    );
  }

  @override
  void dispose() {
    for (var controller in chewieControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoUrls.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chewie(
            controller: chewieControllers[index],
          ),
        );
      },
    );
  }
}
