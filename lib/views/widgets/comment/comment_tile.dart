import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/user_info/providers/user_info_model_provder.dart';
import 'package:instantgram/state/comments/models/comment.dart';
import 'package:instantgram/state/comments/providers/delete_comment_provider.dart';
import 'package:instantgram/views/widgets/animations/small_error_animation_view.dart';
import 'package:instantgram/views/widgets/dialogs/alert_dialog_model.dart';

import '../../../state/auth/notifiers/providers/user_id_provider.dart';
import '../constants/strings.dart';
import '../dialogs/delete_dialog.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;
  const CommentTile({required this.comment, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoModelProvider(
      comment.fromUserId,
    ));
    return userInfo.when(data: (userInfo) {
      final currentUserId = ref.read(userIdProvider);
      return ListTile(
        trailing: currentUserId == comment.fromUserId
            ? IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  final shouldDeleteComment =
                      await displayDeleteDialog(context);
                  if (shouldDeleteComment) {
                    await ref
                        .read(deleteCommentProvider.notifier)
                        .deleteComment(commentId: comment.id);
                  }
                },
              )
            : null,
        title: Text(userInfo.displayName),
        subtitle: Text(comment.comment),
      );
    }, error: (error, stackTrace) {
      return const SmallErrorAnimationView();
    }, loading: () {
      return const CircularProgressIndicator();
    });
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
      const DeleteDialog(titleOfObjectToDelete: Strings.comment)
          .present(context)
          .then((value) => value ?? false);
}
