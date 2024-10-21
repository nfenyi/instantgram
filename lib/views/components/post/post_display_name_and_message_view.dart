import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/user_info/providers/user_info_model_provder.dart';
import 'package:instantgram/views/components/animations/small_error_animation_view.dart';
import 'package:instantgram/views/components/rich_two_part_text.dart';

import '../../../state/auth/user_info/models/user_info_model.dart';
import '../../../state/posts/models/post.dart';

class PostDisplayNameAndMessageView extends ConsumerWidget {
  final Post post;
  const PostDisplayNameAndMessageView({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoModel = ref.watch(userInfoModelProvider(post.userId));
    return userInfoModel.when(data: (UserInfoModel userInfoModel) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RichTwoPartText(
            leftPart: userInfoModel.displayName, rightPart: post.message),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return const SmallErrorAnimationView();
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
