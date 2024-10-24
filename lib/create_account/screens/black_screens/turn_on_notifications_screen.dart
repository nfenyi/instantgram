import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/home/home_screen.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../views/widgets/constants/app_colors.dart';
import '../../../../views/widgets/widgets.dart';

class TurnOnNotificationsScreen extends ConsumerStatefulWidget {
  const TurnOnNotificationsScreen({
    super.key,
  });

  @override
  ConsumerState<TurnOnNotificationsScreen> createState() =>
      _TurnOnNotificationsScreenState();
}

class _TurnOnNotificationsScreenState
    extends ConsumerState<TurnOnNotificationsScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const CustomText(
                      textAlign: TextAlign.center,
                      text: "Turn on notifications",
                      color: Colors.white,
                      size: AppSizes.heading5,
                    ),
                    const Gutter(),
                    const CustomText(
                      textAlign: TextAlign.center,
                      text:
                          "Find out straight away when people follow you or like and comment on your posts..",
                      color: AppColors.neutral200,
                    ),
                    const Gutter(
                      scaleFactor: 2,
                    ),
                    Image.asset(
                      AppAssets.turnOnNotifications,
                      height: 300,
                    )
                  ],
                ),
                CustomButton(
                  callback: () async {
                    if (await Permission.notification.request().isGranted) {
                      if (mounted) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
                    } else {}
                  },
                  text: 'Next',
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
