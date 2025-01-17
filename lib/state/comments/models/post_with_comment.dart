import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:instantgram/state/comments/models/comment.dart';

import '../../posts/models/post.dart';

@immutable
class PostWithComments {
  final Post post;
  final Iterable<Comment> comments;

  const PostWithComments({
    required this.post,
    required this.comments,
  });

  @override
  bool operator ==(covariant PostWithComments other) =>
      post == other.post &&
      //if IterableEquality is not added, two iterables can never be equal if their ordering is different
      const IterableEquality().equals(comments, other.comments);

  @override
  int get hashCode => Object.hashAll([post, comments]);
}
