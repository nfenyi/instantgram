import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/notifiers/providers/auth_state_provider.dart';
import 'package:instantgram/state/image_upload/helpers/image_picker_helper.dart';
import 'package:instantgram/state/image_upload/models/file_type.dart';
import 'package:instantgram/state/post_settings/providers/post_setting_provider.dart';
import 'package:instantgram/views/widgets/dialogs/alert_dialog_model.dart';
import 'package:instantgram/views/widgets/dialogs/logout_dialog.dart';
import 'package:instantgram/views/constants/strings.dart';
import 'package:instantgram/views/create_new_post/create_new_post_view.dart';
import 'package:instantgram/views/tabs/home/home_view.dart';
import 'package:instantgram/views/tabs/search/search_view.dart';
import 'package:instantgram/views/tabs/user_post/users_posts_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
                onPressed: () async {
                  final videoFile =
                      await ImagePickerHelper.pickVideoFromGallery();
                  if (videoFile == null) {
                    return;
                  }
                  ref.invalidate(postSettingProvider);

                  //go to the screen to create a new post
                  if (!mounted) {
                    return;
                  }
                  if (mounted) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CreateNewPostView(videoFile, FileType.video);
                    }));
                  }
                },
                icon: const FaIcon(FontAwesomeIcons.film)),
            IconButton(
                onPressed: () async {
                  final imageFile =
                      await ImagePickerHelper.pickImageFromGallery();
                  if (imageFile == null) {
                    return;
                  }
                  ref.invalidate(postSettingProvider);

                  //go to the screen to create a new post
                  if (!mounted) {
                    return;
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreateNewPostView(imageFile, FileType.image);
                  }));
                },
                icon: const Icon(Icons.add_photo_alternate_outlined)),
            IconButton(
                onPressed: () async {
                  final shouldLogOut = await const LogoutDialog()
                      .present(context)
                      .then((value) => value ?? false);
                  if (shouldLogOut) {
                    await ref.read(authStateProvider.notifier).logOut();
                  }
                },
                icon: const Icon(Icons.logout)),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.house),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          UserPostsView(),
          SearchView(),
          HomeView(),
        ]),
      ),
    );
  }
}
