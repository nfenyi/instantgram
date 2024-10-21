import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/image_upload/notifiers/image_upload_notifiers.dart';
import 'package:instantgram/state/image_upload/typedefs/is_loading.dart';

final imageUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, IsLoading>((ref) {
  return ImageUploadNotifier();
});
