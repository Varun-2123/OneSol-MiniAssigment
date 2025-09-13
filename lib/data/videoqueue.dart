import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class VideoQueue {
  static const String _videoKey = "video_queue";
  static const String _likeKey = "video_likes";

  /// Add video path
  static Future<void> addVideo(String path) async {
    final prefs = await SharedPreferences.getInstance();
    final videos = prefs.getStringList(_videoKey) ?? [];
    if (!videos.contains(path)) {
      videos.add(path);
      await prefs.setStringList(_videoKey, videos);
    }
  }

  /// Get all videos
  static Future<List<String>> getVideos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_videoKey) ?? [];
  }

  /// Get likes map {path: likes}
  static Future<Map<String, int>> getLikes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_likeKey);
    if (jsonStr == null) return {};
    return Map<String, int>.from(jsonDecode(jsonStr));
  }

  /// Increment like for a video
  static Future<int> likeVideo(String path) async {
    final prefs = await SharedPreferences.getInstance();
    final likes = await getLikes();
    likes[path] = (likes[path] ?? 0) + 1;
    await prefs.setString(_likeKey, jsonEncode(likes));
    return likes[path]!;
  }

  /// Get likes for a single video
  static Future<int> getLikeForVideo(String path) async {
    final likes = await getLikes();
    return likes[path] ?? 0;
  }
}
