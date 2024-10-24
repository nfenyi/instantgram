import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/user_info/providers/user_info_model_provder.dart';
import 'package:instantgram/state/comments/models/comment.dart';
import 'package:instantgram/views/widgets/animations/small_error_animation_view.dart';
import 'package:instantgram/views/widgets/rich_two_part_text.dart';

class CompactCommentTile extends ConsumerWidget {
  final Comment comment;
  const CompactCommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoModelProvider(
      comment.fromUserId,
    ));
    return userInfo.when(
      error: (error, stackTrace) {
        return const SmallErrorAnimationView();
      },
      loading: () => const CircularProgressIndicator(),
      data: (userInfo) {
        return RichTwoPartText(
            leftPart: userInfo.displayName, rightPart: comment.comment);
      },
    );
  }
}
