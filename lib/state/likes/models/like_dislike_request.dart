import 'package:flutter/foundation.dart';
import 'package:instantgram/state/posts/typedefs/user_id.dart';

import '../../posts/typedefs/post_id.dart';

@immutable
class LikeDislikeRequest {
  final PostId postId;
  final UserId likedBy;

  const LikeDislikeRequest({required this.postId, required this.likedBy});
}
