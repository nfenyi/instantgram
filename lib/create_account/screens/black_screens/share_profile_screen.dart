import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/black_screens/follow_people_screen.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

import '../../../../views/widgets/constants/app_colors.dart';
import '../../../../views/widgets/widgets.dart';

class ShareProfileScreen extends ConsumerStatefulWidget {
  const ShareProfileScreen({
    super.key,
  });

  @override
  ConsumerState<ShareProfileScreen> createState() => _ShareProfileScreenState();
}

class _ShareProfileScreenState extends ConsumerState<ShareProfileScreen> {
  final TextEditingController _numberController = TextEditingController();
  final Gradient _gradient = const LinearGradient(
    colors: [Colors.red, Colors.orange, Colors.red],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  void dispose() {
    _numberController.dispose();
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: "Invite friends to follow you",
                      color: Colors.white,
                      size: AppSizes.heading5,
                    ),
                    const Gutter(),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text:
                          "Share your profile with friends so they can start following you.",
                      color: AppColors.neutral200,
                    ),
                    Container(
                      padding: const EdgeInsets.all(50),
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: AppColors.neutral300,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage(
                              AppAssets.noProfile,
                            ),
                          ),
                          ShaderMask(
                            blendMode: BlendMode.modulate,
                            shaderCallback: (bounds) => _gradient.createShader(
                                Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height)),
                            child: const CustomText(
                              text: '[username]',
                              color: Colors.white,
                              size: AppSizes.heading5,
                            ),
                          ),
                          const CustomText(
                            text: '[name]',
                            color: Colors.white,
                            size: AppSizes.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const Gutter(
                      scaleFactor: 4,
                    ),
                  ],
                ),
                const Divider(),
                const Gutter(),
                CustomButton(
                  callback: () async {},
                  text: 'Share profile',
                  borderRadius: 10,
                  height: 50,
                ),
                const Gutter(),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const FollowPeopleScreen(),
                  )),
                  child: const CustomText(
                    text: "Next",
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
