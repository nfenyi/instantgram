import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/black_screens/turn_on_notifications_screen.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../views/widgets/constants/app_colors.dart';
import '../../../../views/widgets/widgets.dart';

class FollowPeopleScreen extends ConsumerStatefulWidget {
  const FollowPeopleScreen({
    super.key,
  });

  @override
  ConsumerState<FollowPeopleScreen> createState() => _FollowPeopleScreenState();
}

class _FollowPeopleScreenState extends ConsumerState<FollowPeopleScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool isFollowing = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPaddingSmall),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Try following 5+ people',
                  color: Colors.white,
                  size: AppSizes.heading5,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const TurnOnNotificationsScreen(),
                  )),
                  child: const CustomText(
                    text: "Skip",
                    size: AppSizes.bodySmall,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const CustomText(
                      textAlign: TextAlign.center,
                      text:
                          "Following isn't required, but it's recommended for a personalised experience.",
                      color: AppColors.neutral100,
                      size: AppSizes.bodySmallest,
                    ),
                    const Gutter(),
                    CustomTextFormField(
                      height: 10,
                      controller: _searchController,
                      hintText: 'Search',
                      hintStyleColor: Colors.white,
                      prefixIcon:
                          const FaIcon(FontAwesomeIcons.magnifyingGlass),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 99, 98, 98),
                      enabledBorderColor: Colors.transparent,
                    ),
                    const Gutter(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: const CustomText(
                            text: '[name]',
                            isWhite: true,
                          ),
                          subtitle: const CustomText(
                            text: '[username]',
                            isWhite: true,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFollowing = !isFollowing;
                              });
                            },
                            child: isFollowing
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                  )
                                : const Icon(Icons.circle_outlined),
                          ),
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.noProfile),
                          ),
                        );
                      },
                    )
                  ],
                ),
                const Divider(),
                const Gutter(),
                CustomButton(
                  callback: () async {
                    if (await Permission.contacts.request().isGranted) {
                      if (mounted) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                const TurnOnNotificationsScreen()));
                      }
                    } else {}
                  },
                  text: 'Follow',
                  borderRadius: 10,
                  height: 50,
                ),
                const Gutter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
