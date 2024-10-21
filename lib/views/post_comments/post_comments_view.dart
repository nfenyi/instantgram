import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/notifiers/providers/user_id_provider.dart';
import 'package:instantgram/state/comments/models/post_comment_request.dart';
import 'package:instantgram/state/comments/providers/post_comments_provider.dart';
import 'package:instantgram/state/posts/typedefs/post_id.dart';
import 'package:instantgram/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instantgram/views/components/animations/error_animation_view.dart';
import 'package:instantgram/views/components/animations/loading_animation_view.dart';
import 'package:instantgram/views/constants/strings.dart';
import 'package:instantgram/views/extensions/dismiss_keyboard.dart';

import '../../state/comments/providers/send_comment_provider.dart';
import '../components/comment/comment_tile.dart';

class PostCommentsView extends HookConsumerWidget {
  final PostId postId;
  const PostCommentsView({
    super.key,
    required this.postId,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final hasText = useState(false);
    final request = useState(RequestForPostAndComments(
      postId: postId,
    ));

    final comments = ref.watch(postCommentsProvider(request.value));
    useEffect(() {
      commentController.addListener(
        () {
          hasText.value = commentController.text.isNotEmpty;
        },
      );
      return null;
    }, [commentController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.comments),
        actions: [
          IconButton(
              onPressed: hasText.value
                  ? () {
                      _submitCommentWithController(commentController, ref);
                    }
                  : null,
              icon: const Icon(Icons.send))
        ],
      ),
      body: SafeArea(
          child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 4,
            child: comments.when(data: (comments) {
              if (comments.isEmpty) {
                return const SingleChildScrollView(
                  child: EmptyContentsWithTextAnimationView(
                      text: Strings.noCommentsYet),
                );
              } else {
                return RefreshIndicator(
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      final comment = comments.elementAt(index);
                      return CommentTile(comment: comment);
                    }),
                    itemCount: comments.length,
                    padding: const EdgeInsets.all(8),
                  ),
                  onRefresh: () {
                    ref.invalidate(postCommentsProvider(request.value));
                    return Future.delayed(
                      const Duration(seconds: 1),
                    );
                  },
                );
              }
            }, error: (error, stackTrace) {
              return const ErrorAnimationView();
            }, loading: () {
              return const LoadingAnimationView();
            }),
          ),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      textInputAction: TextInputAction.send,
                      onSubmitted: (comment) {
                        if (comment.isNotEmpty) {
                          _submitCommentWithController(commentController, ref);
                        }
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: Strings.writeYourCommentHere),
                      controller: commentController,
                    ),
                  )))
        ],
      )),
    );
  }

  Future<void> _submitCommentWithController(
      TextEditingController controller, WidgetRef ref) async {
    final userId = ref.read(userIdProvider);
    if (userId == null) return;
    final isSent = await ref.read(sendCommentProvider.notifier).sendComment(
          fromUserId: userId,
          onPostId: postId,
          comment: controller.text,
        );
    if (isSent) {
      controller.clear();
      dismissKeyboard();
    }
  }
}
