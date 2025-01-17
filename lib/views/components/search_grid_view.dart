import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/posts/providers/posts_by_search_term_provider.dart';
import 'package:instantgram/views/components/animations/data_not_found_animation_view.dart';
import 'package:instantgram/views/components/animations/empty_contents_with_text_animation_view.dart';
import 'package:instantgram/views/components/animations/small_error_animation_view.dart';
import 'package:instantgram/views/constants/strings.dart';

import '../../state/posts/typedefs/search_term.dart';
import 'post/post_sliver_grid_view.dart';

class SearchGridView extends ConsumerWidget {
  final SearchTerm searchTerm;
  const SearchGridView({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchTerm.isEmpty) {
      return const SliverToBoxAdapter(
        child: EmptyContentsWithTextAnimationView(
            text: Strings.enterYourSearchTerm),
      );
    }
    final posts = ref.watch(postsBySearchTermProvider(
      searchTerm,
    ));
    return posts.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const SliverToBoxAdapter(child: DataNotFoundAnimationView());
        }
        return PostsSliverGridView(posts: posts);
      },
      error: (error, stackTrace) =>
          const SliverToBoxAdapter(child: SmallErrorAnimationView()),
      loading: () =>
          const SliverToBoxAdapter(child: CircularProgressIndicator()),
    );
  }
}
