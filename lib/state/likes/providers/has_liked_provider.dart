import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/constants/firebase_collection_name.dart';
import 'package:instantgram/state/auth/notifiers/providers/user_id_provider.dart';
import 'package:instantgram/state/constants/firebase_field_name.dart';

import '../../posts/typedefs/post_id.dart';

final hasLikedPostProvider = StreamProvider.family.autoDispose<bool, PostId>(
  (ref, PostId postId) {
    final userId = ref.watch(userIdProvider);
    if (userId == null) {
      return Stream<bool>.value(false);
    }
    final controller = StreamController<bool>();
    final sub = FirebaseFirestore.instance
        .collection(FirebaseCollectionName.likes)
        .where(
          FirebaseFieldName.postId,
          isEqualTo: postId,
        )
        .where(FirebaseFieldName.userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        controller.add(true);
      } else {
        controller.add(false);
      }
    });
    ref.onDispose(() {
      controller.close();
      sub.cancel();
    });
    return controller.stream;
  },
);
