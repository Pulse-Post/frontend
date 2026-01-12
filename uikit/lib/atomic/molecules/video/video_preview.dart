// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoPreview extends StatelessWidget {
  final File file;
  const VideoPreview({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
        future: VideoThumbnail.thumbnailData(
          video: file.path,
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
