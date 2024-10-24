import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/enums/date_sorting.dart';
import 'package:instantgram/state/comments/models/post_comment_request.dart';
import 'package:instantgram/state/comments/models/post_with_comment.dart';
import 'package:instantgram/state/posts/models/post.dart';
import 'package:instantgram/state/posts/providers/can_current_user_delete_post_provider.dart';
import 'package:instantgram/state/posts/providers/delete_post_provider.dart';
import 'package:instantgram/state/posts/providers/specific_post_with_comments_provider.dart';
import 'package:instantgram/views/widgets/animations/small_error_animation_view.dart';
import 'package:instantgram/views/widgets/comment/compact_comment_column.dart';
import 'package:instantgram/views/widgets/dialogs/alert_dialog_model.dart';
import 'package:instantgram/views/widgets/dialogs/delete_dialog.dart';
import 'package:instantgram/views/widgets/like_button.dart';
import 'package:instantgram/views/widgets/likes_count_view.dart';
import 'package:instantgram/views/widgets/post/post_date_view.dart';
import 'package:instantgram/views/widgets/post/post_display_name_and_message_view.dart';
import 'package:instantgram/views/widgets/post/post_image_or_video_view.dart';
import 'package:instantgram/views/constants/strings.dart';
import 'package:instantgram/views/post_comments/post_comments_view.dart';
import 'package:share_plus/share_plus.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;
  const PostDetailsView({super.key, required this.post});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {
    final request = RequestForPostAndComments(
        postId: widget.post.postId,
        dateSorting: DateSorting.oldestOnTop,
        limit: 3,
        sortByCreatedAt: true);

    //get the actual post together with its comments
    final postWithComments = ref.watch(specificPostWithCommentsProvider(
      request,
    ));

    //can we delete this post?
    final canDeletePost =
        ref.watch(canCurrentUserDeletePostProvider(widget.post));

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.postDetails),
        actions: [
          postWithComments.when(data: (postWithComments) {
            return IconButton(
                onPressed: () {
                  final url = postWithComments.post.fileUrl;
                  Share.share(url, subject: Strings.checkOutThis);
                },
                icon: const Icon(Icons.share));
          }, error: (error, stackTrace) {
            return const SmallErrorAnimationView();
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),

          //delete button or no delete button depending on whether  the user is authorized to delete the post
          if (canDeletePost.value ?? false)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final shouldDeletePost = await const DeleteDialog(
                  titleOfObjectToDelete: Strings.post,
                )
                    .present(context)
                    .then((shouldDelete) => shouldDelete ?? false);
                if (shouldDeletePost) {
                  await ref
                      .read(deletePostProvider.notifier)
                      .deletePost(post: widget.post);
                  if (mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            )
        ],
      ),
      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(
                  post: postWithComments.post,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //like button if post allows liking
                    if (postWithComments.post.allowLikes)
                      LikeButton(
                        postId: postId,
                      ),

                    //comment button if post allows comments
                    if (postWithComments.post.allowComments)
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostCommentsView(postId: postId),
                            ),
                          );
                        },
                        icon: const Icon(Icons.mode_comment_outlined),
                      ),
                  ],
                ),

                //post details (show divider at the bottom)
                PostDisplayNameAndMessageView(post: postWithComments.post),
                PostDateView(dateTime: postWithComments.post.createdAt),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.white70,
                  ),
                ),
                //display the comments
                CompactCommentColumn(comments: postWithComments.comments),
                if (postWithComments.post.allowLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikesCountView(
                          postId: postId,
                        ),
                      ],
                    ),
                  ),

                //add spacing to bottom of screen
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const SmallErrorAnimationView();
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
