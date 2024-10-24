import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/black_screens/facebook_suggestions_screen.dart';
import 'package:instantgram/create_account/screens/forms/confirm_via_sms_screen.dart';
import 'package:instantgram/stepper_provider/stepper_provider.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../views/widgets/constants/app_colors.dart';
import '../../../../views/widgets/widgets.dart';

class AllowContactsAccessScreen extends ConsumerStatefulWidget {
  const AllowContactsAccessScreen({
    super.key,
  });

  @override
  ConsumerState<AllowContactsAccessScreen> createState() =>
      _AllowContactsAccessScreenState();
}

class _AllowContactsAccessScreenState
    extends ConsumerState<AllowContactsAccessScreen> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    CustomText(
                      textAlign: TextAlign.center,
                      text:
                          "Next, you can allow access to your contacts to make it easier to find your friends on Instagram",
                      color: Colors.white,
                      size: AppSizes.heading5,
                    ),
                    Gutter(
                      scaleFactor: 0.5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(FontAwesomeIcons.arrowRotateLeft),
                        Gutter(),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    "Your contacts will be periodically synced and stored securely on our servers so that we can help recommend people and things that are relevant to you.",
                                color: AppColors.neutral300,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Gutter(
                      scaleFactor: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.gear,
                        ),
                        Gutter(),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    "You can turn off syncing at any time in Settings. Learn more.",
                                color: AppColors.neutral300,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                      callback: () async {
                        if (await Permission.contacts.request().isGranted) {
                          if (mounted) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FacebookSuggestionsScreen()));
                          }
                        } else {
                          // if (mounted) {
                          //   Navigator.of(context).pop();
                          // }
                        }
                      },
                      text: 'Next',
                      borderRadius: 10,
                      height: 50,
                    ),
                    const CustomText(
                      size: AppSizes.bodySmallest,
                      text:
                          "By tapping Next, you can choose to sync your contacts or skip this step.",
                      color: AppColors.neutral300,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
