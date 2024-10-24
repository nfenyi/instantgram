import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/create_account/screens/forms/create_password.dart';
import 'package:instantgram/create_account/screens/forms/profile_picture.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

import '../../../views/widgets/constants/app_colors.dart';
import '../../../views/widgets/widgets.dart';

class TermsAndPoliciesScreen extends ConsumerStatefulWidget {
  const TermsAndPoliciesScreen({
    super.key,
  });

  @override
  ConsumerState<TermsAndPoliciesScreen> createState() =>
      _TermsAndPoliciesScreenState();
}

class _TermsAndPoliciesScreenState
    extends ConsumerState<TermsAndPoliciesScreen> {
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
                    text: "Agree to Instagram's terms and policies",
                    color: Colors.white,
                    size: AppSizes.heading5,
                  ),
                  const Gutter(
                    scaleFactor: 0.5,
                  ),
                  const CustomText(
                    text:
                        "People who use our service may have uploaded your contact information to Instagram. Learn more",
                    color: Colors.white,
                    size: AppSizes.bodySmaller,
                  ),
                  const Gutter(),
                  const CustomText(
                    text:
                        "By tapping I agree, you agree to create an account and to Instagram's Terms. Privacy Policy and Cookies Policy.",
                    color: Colors.white,
                    size: AppSizes.bodySmaller,
                  ),
                  const Gutter(),
                  const CustomText(
                    text:
                        "The Privacy Policy describes the ways we can use the information we collect when you create an account. For example, we use this information to provide, personalise and improve our products, including ads.",
                    color: Colors.white,
                    size: AppSizes.bodySmaller,
                  ),
                  const Gutter(),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProfilePictureScreen()), (r) {
                        return false;
                      });
                    },
                    text: 'I agree',
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
