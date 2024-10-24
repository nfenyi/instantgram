import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/create_account/screens/forms/create_a_username_screen.dart';
import 'package:instantgram/create_account/screens/forms/create_password.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

import '../../../views/widgets/constants/app_colors.dart';
import '../../../views/widgets/widgets.dart';

class NameScreen extends ConsumerStatefulWidget {
  const NameScreen({
    super.key,
  });

  @override
  ConsumerState<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen> {
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  void dispose() {
    _dateOfBirthController.dispose();
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
                    text: "What's your name?",
                    color: Colors.white,
                    size: AppSizes.heading5,
                  ),
                  const Gutter(
                    scaleFactor: 1.5,
                  ),
                  CustomTextFormField(
                    controller: _dateOfBirthController,
                    hintText: 'Full name',
                    textColor: Colors.white,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  const Gutter(
                    scaleFactor: 2,
                  ),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateUsernameScreen()));
                    },
                    text: 'Next',
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

  static const int _timerDurationSeconds = 120; // 2 minutes in seconds
  late Timer _timer;
  late int _secondsRemaining;

  void _startTimer() {
    _secondsRemaining = _timerDurationSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
