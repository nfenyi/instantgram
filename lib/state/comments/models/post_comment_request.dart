import 'package:flutter/foundation.dart';
import 'package:instantgram/enums/date_sorting.dart';
import 'package:instantgram/state/posts/typedefs/post_id.dart';

@immutable
class RequestForPostAndComments {
  final PostId postId;
  final bool sortByCreatedAt;
  final DateSorting dateSorting;
  final int? limit;

  const RequestForPostAndComments({
    required this.postId,
    this.sortByCreatedAt = true,
    this.dateSorting = DateSorting.newestOnTop,
    this.limit,
  });

  @override
  int get hashCode => Object.hashAll([
        postId,
        sortByCreatedAt,
        dateSorting,
        limit,
      ]);

  @override
  bool operator ==(covariant RequestForPostAndComments other) {
    return postId == other.postId &&
        sortByCreatedAt == other.sortByCreatedAt &&
        limit == other.limit &&
        dateSorting == other.dateSorting;
  }
}
