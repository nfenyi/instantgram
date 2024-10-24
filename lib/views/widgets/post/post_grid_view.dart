import 'package:flutter/material.dart';
import 'package:instantgram/state/posts/models/post.dart';
import 'package:instantgram/views/widgets/post/post_thumbnail_view.dart';
import 'package:instantgram/views/post_details/post_details_view.dart';

class PostsGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const PostsGridView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemBuilder: (BuildContext context, int index) {
        final post = posts.elementAt(index);
        return PostThumbnailView(
            post: post,
            onTapped: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailsView(post: post),
                ),
              );
            });
      },
      itemCount: posts.length,
    );
  }
}
