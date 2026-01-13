// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoPreview extends StatelessWidget {
  final File? file;
  final String? videoUrl;

  const VideoPreview({
    super.key,
    this.file,
    this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
        future: VideoThumbnail.thumbnailData(
          video: file != null ? file!.path : videoUrl!,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 400,
          quality: 75,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 120,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Image.memory(
            snapshot.data!,
            width: double.infinity,
            fit: BoxFit.cover,
          );
        });
  }
}
