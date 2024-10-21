import 'package:flutter/material.dart' show immutable;

@immutable
class PostKey {
  static const userId = 'uid';
  static const message = 'message';
  static const createdAt = 'created_at';
  static const thumbnailUrl = 'thumbnail_url';
  static const fileType = 'file_type';
  static const fileUrl = 'file_url';
  static const fileName = 'file_name';
  static const aspectRatio = 'aspect_ratio';
  static const postSettings = 'post_settings';
  static const thumbnailStorageId = 'thumbnail_storage_id';
  static const originalFileStorageId = 'original_storage_id';

  const PostKey._();
}
