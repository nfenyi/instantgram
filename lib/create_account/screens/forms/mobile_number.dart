import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/create_account/screens/forms/confirm_via_phone_call_screen.dart';
import 'package:instantgram/create_account/screens/forms/email_address_screen.dart';
import 'package:instantgram/views/widgets/constants/app_colors.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

import '../../../views/widgets/widgets.dart';

class MobileNumberScreen extends ConsumerStatefulWidget {
  const MobileNumberScreen({
    super.key,
  });

  @override
  ConsumerState<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends ConsumerState<MobileNumberScreen> {
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
                  const CustomText(
                    text: "What's your mobile number?",
                    color: Colors.white,
                    size: AppSizes.heading5,
                  ),
                  const Gutter(
                    scaleFactor: 0.5,
                  ),
                  const CustomText(
                    text:
                        "Enter the mobile number on which you can be contacted. \nNo one will see this on your profile.",
                    color: Colors.white,
                    size: AppSizes.bodySmaller,
                  ),
                  const Gutter(
                    scaleFactor: 2,
                  ),
                  CustomTextFormField(
                    controller: _numberController,
                    hintText: 'Mobile number',
                    textColor: Colors.white,
                  ),
                  const Gutter(
                    scaleFactor: 0.5,
                  ),
                  const CustomText(
                    text:
                        "You may receive WhatsApp and SMS notifications from us for security and login purposes.",
                    color: Colors.white,
                  ),
                  const Gutter(),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const ConfirmViaPhoneCallScreen()));
                    },
                    text: 'Next',
                  ),
                  const Gutter(),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const EmailAddressScreen()));
                    },
                    // style: TextButton.styleFrom(
                    //     backgroundColor: AppColors.loginButtonColor,
                    //     foregroundColor:
                    //         AppColors.loginButtonTextColor),
                    text: 'Sign up with email address',
                    isSecondary: true,
                    buttonColor: Colors.white,
                  ),
                ],
              ),
              Center(
                child: GestureDetector(
                  child: const CustomText(
                    text: "I already have an account",
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
