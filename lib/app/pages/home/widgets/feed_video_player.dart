import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// [FeedVideoPlayer] widget help to player feeds video with features like e.g.
/// * pinch zoom.
/// * tap to mute and unmute.
/// * play video when feed within user's screen.
///
/// Properties need -
/// * [videoUrl] is the url of video.
///
class FeedVideoPlayer extends StatefulWidget {
  const FeedVideoPlayer({
    Key? key,
    @required this.videoUrl,
  }) : super(key: key);

  final String? videoUrl;

  @override
  State<FeedVideoPlayer> createState() => _FeedVideoPlayerState();
}

class _FeedVideoPlayerState extends State<FeedVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  var _isPlaying = true;

  var height = Get.height;
  var width = Get.width;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl!)
      ..initialize().then((_) {});
    // _videoPlayerController.play();
    _videoPlayerController.setLooping(true);
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _videoPlayerController.dispose();
    _videoPlayerController.setVolume(0.0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (_isPlaying) {
            _videoPlayerController.pause();
          } else {
            _videoPlayerController.play();
          }
          _isPlaying = !_isPlaying;
          setState(() {});
        },
        child: VisibilityDetector(
          key: widget.key!,
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0) {
              if (!_videoPlayerController.value.isPlaying) {
                _videoPlayerController.play();

                setState(() {});
              }
            } else {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();

                setState(() {});
              }
            }
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: SizedBox(
              height: height,
              width: width,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        ),
      );
}
