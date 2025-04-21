import 'package:flutter/material.dart';
import 'package:tvpro/models/streams.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class PlayerPopup extends StatefulWidget {
  final StreamModel stream;

  const PlayerPopup({super.key, required this.stream});

  @override
  State<PlayerPopup> createState() => _PlayerPopupState();
}

class _PlayerPopupState extends State<PlayerPopup> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.stream.url ?? ""),
        httpHeaders: {
          'Referer': widget.stream.referrer ?? "",
          'User-Agent': widget.stream.userAgent ?? "",
        },
      )
      ..initialize().then((_) {
        _chewieController = ChewieController(
          videoPlayerController: _videoController,
          autoPlay: true,
          looping: false,
        );
        setState(() {});
      });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.stream.name ?? ""),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child:
            _chewieController != null
                ? Chewie(controller: _chewieController!)
                : const CircularProgressIndicator(),
      ),
    );
  }
}
