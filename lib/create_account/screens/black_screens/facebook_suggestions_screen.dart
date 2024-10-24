import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/black_screens/share_profile_screen.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../views/widgets/constants/app_colors.dart';
import '../../../../views/widgets/widgets.dart';

class FacebookSuggestionsScreen extends ConsumerStatefulWidget {
  const FacebookSuggestionsScreen({
    super.key,
  });

  @override
  ConsumerState<FacebookSuggestionsScreen> createState() =>
      _FacebookSuggestionsScreenState();
}

class _FacebookSuggestionsScreenState
    extends ConsumerState<FacebookSuggestionsScreen> {
  final TextEditingController _numberController = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      AppAssets.facebookSuggestionAdd,
                      height: 150,
                    ),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: "Get Facebook suggestions",
                      color: Colors.white,
                      size: AppSizes.heading5,
                    ),
                    const Gutter(),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text:
                          "You can find people you know from Facebook with Accounts Centre.",
                      color: AppColors.neutral200,
                    ),
                    const Gutter(
                      scaleFactor: 4,
                    ),
                  ],
                ),
                CustomButton(
                  callback: () async {},
                  text: 'Continue',
                  borderRadius: 10,
                  height: 50,
                ),
                const CustomText(
                  size: AppSizes.bodySmallest,
                  text:
                      "John Doe, Jane Doe and [number] others are using Instantgram.",
                  color: AppColors.neutral300,
                ),
                const Gutter(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const ShareProfileScreen())),
                  child: const CustomText(
                    text: "Skip",
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
