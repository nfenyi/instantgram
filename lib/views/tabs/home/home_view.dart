import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/posts/providers/all_posts_provider.dart';
import 'package:instantgram/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instantgram/views/components/animations/loading_animation_view.dart';
import 'package:instantgram/views/components/animations/small_error_animation_view.dart';
import 'package:instantgram/views/components/post/post_grid_view.dart';

import '../../constants/strings.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostsProvider);

    return RefreshIndicator(
      onRefresh: () {
        ref.invalidate(allPostsProvider);
        return Future.delayed(
          const Duration(seconds: 1),
        );
      },
      child: posts.when(
          data: (posts) {
            if (posts.isEmpty) {
              return const EmptyContentsWithTextAnimationView(
                  text: Strings.noPostsAvailable);
            }
            return PostsGridView(posts: posts);
          },
          error: (error, stackTrace) => const SmallErrorAnimationView(),
          loading: () => const LoadingAnimationView()),
    );
  }
}
