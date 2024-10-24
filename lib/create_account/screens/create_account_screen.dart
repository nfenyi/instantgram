import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/stepper_provider/stepper_provider.dart';
import 'package:instantgram/views/widgets/constants/app_colors.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';
import 'package:instantgram/views/widgets/widgets.dart';

import 'forms/mobile_number.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  late final stepper = ref.watch(stepperCountProvider);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                  horizontal: (AppSizes.horizontalPaddingSmall)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (stepper == 0) const MobileNumberScreen(),
                    Center(
                      child: GestureDetector(
                        child: const CustomText(
                          text: "I already have an account",
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
