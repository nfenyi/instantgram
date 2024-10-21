import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/posts/models/post.dart';

import '../../auth/notifiers/providers/user_id_provider.dart';

final canCurrentUserDeletePostProvider =
    StreamProvider.family.autoDispose<bool, Post>((ref, Post post) async* {
  final userId = ref.watch(userIdProvider);
  yield userId == post.userId;
});
