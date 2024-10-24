import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/forms/confirm_via_sms_screen.dart';
import 'package:instantgram/stepper_provider/stepper_provider.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

import '../../../views/widgets/constants/app_colors.dart';
import '../../../views/widgets/widgets.dart';

class ConfirmViaPhoneCallScreen extends ConsumerStatefulWidget {
  const ConfirmViaPhoneCallScreen({
    super.key,
  });

  @override
  ConsumerState<ConfirmViaPhoneCallScreen> createState() =>
      _ConfirmViaPhoneCallScreenState();
}

class _ConfirmViaPhoneCallScreenState
    extends ConsumerState<ConfirmViaPhoneCallScreen> {
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(-1, -0.5),
            end: Alignment(1, 0.5),
            colors: [
              Color.fromARGB(255, 41, 22, 37),
              Color.fromARGB(255, 4, 20, 45),
              Color.fromARGB(255, 4, 20, 45),
              Color.fromARGB(255, 4, 20, 45),
              Color.fromARGB(255, 33, 54, 53),
            ],
            stops: [
              0.0,
              0.2,
              0.5,
              0.8,
              1.0
            ]),
      ),
      child: Scaffold(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      AppAssets.phoneCallVerification,
                      // height: 20,
                    ),
                  ),
                  const Gutter(),
                  const CustomText(
                    text:
                        "To confirm your account with a call, allow Instagram to:",
                    color: Colors.white,
                    size: AppSizes.heading5,
                  ),
                  const Gutter(
                    scaleFactor: 0.5,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.phone_callback_outlined),
                      Gutter(),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Manage phone calls",
                              color: Colors.white,
                            ),
                            CustomText(
                              text:
                                  "We'll call your mobile number and end the call automatically,.",
                              color: AppColors.neutral300,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Gutter(
                    scaleFactor: 2,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.menu),
                      Gutter(),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Access call logs",
                              color: Colors.white,
                            ),
                            CustomText(
                              text:
                                  "We'll check to confirm that you received the call.",
                              color: AppColors.neutral300,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Gutter(
                    scaleFactor: 2,
                  ),
                  CustomButton(
                    callback: () {
                      ref
                          .read(stepperCountProvider.notifier)
                          .increaseStepCount();
                    },
                    text: 'Next',
                  ),
                  const Gutter(),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ConfirmViaSMSScreen()));
                    },
                    // style: TextButton.styleFrom(
                    //     backgroundColor: AppColors.loginButtonColor,
                    //     foregroundColor:
                    //         AppColors.loginButtonTextColor),
                    text: 'Confirm with SMS instead',
                    isSecondary: true,
                    buttonColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
