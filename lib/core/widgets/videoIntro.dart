// ignore_for_file: unused_local_variable

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class introVideo extends StatefulWidget {
  const introVideo({super.key});

  @override
  State<introVideo> createState() => _introVideoState();
}

class _introVideoState extends State<introVideo> {
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoURL = 'assets/videos/products.mp4';

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomVideoPlayer(
          customVideoPlayerController: _customVideoPlayerController),
    );
  }

  void initializeVideoPlayer() {
    VideoPlayerController videoplayerController;
    videoplayerController = VideoPlayerController.asset(videoURL)
      ..initialize().then((value) {
        setState(() {});
      });
    // _customVideoPlayerController = CustomVideoPlayerController(
    //     context: context, videoPlayerController: _videoplayerController);
  }
}
