import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_assignment_onesol/data/videoqueue.dart';
// import 'package:mini_assignment_onesol/widget/uihelper.dart';
import 'package:video_player/video_player.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> videoPaths = [];
  Map<String, int> likeCounts = {};
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    final videos = await VideoQueue.getVideos();
    final likes = await VideoQueue.getLikes();
    setState(() {
      videoPaths = videos;
      likeCounts = likes;
    });
  }

  Future<void> _pickAndSaveVideo() async {
    final XFile? picked = await picker.pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      await VideoQueue.addVideo(picked.path);
      _loadVideos();
    }
  }

  Future<void> _likeVideo(String path) async {
    final newCount = await VideoQueue.likeVideo(path);
    setState(() {
      likeCounts[path] = newCount;
    });
  }

  var likeButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body:
          videoPaths.isEmpty
              ? const Center(child: Text("No videos saved yet"))
              : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: videoPaths.length,
                itemBuilder: (context, index) {
                  final path = videoPaths[index];
                  final likes = likeCounts[path] ?? 0;
                  return Stack(
                    children: [
                      VideoPlayerWidget(path: path),
                      // like button jiska color change hona tha
                      Positioned(
                        bottom: 350,
                        right: 10,
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ),
                              onPressed: () => _likeVideo(path),
                            ),
                            Text(
                              "$likes",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 292,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Container(
                                          width: 200,
                                          height: 5,
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              labelText: "Comments",
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            SizedBox(width: 20),
                                            Text(
                                              "User 123:   ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              "ye ek comment hai kjdfnsdnfsndfkjsnd",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(width: 20),
                                            Text(
                                              "User 234:   ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              "ye ek comment hai kjd",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(width: 20),
                                            Text(
                                              "User 345:   ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              "ye ek comment hai ",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(width: 20),
                                            Text(
                                              "User 456:   ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              "ye ek comment hai kjdfnsdnfsndfkjsndkjfnskd",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SizedBox(width: 20),
                                            Text(
                                              "User 567:   ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              "ye ek comment hai kjdfnsdnfsskd",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.comment,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 225,
                        right: 20,
                        child: Column(
                          children: [
                            Icon(
                              Icons.bar_chart_rounded,
                              color: Colors.white,
                              size: 38,
                            ),
                            Text(
                              "Views",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: SizedBox(
                          height: 140,
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Video ${index + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "Description",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "This video has $likes like and 10 views.This is an amazing video, bohut maza",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAndSaveVideo,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String path;
  const VideoPlayerWidget({super.key, required this.path});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.file(File(widget.path))
          ..setLooping(true)
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        )
        : const Center(child: CircularProgressIndicator());
  }
}
