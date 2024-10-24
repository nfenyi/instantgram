import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/create_account/screens/forms/create_password.dart';
import 'package:instantgram/create_account/screens/forms/mobile_number.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

import '../../../views/widgets/widgets.dart';

class ConfirmViaSMSScreen extends ConsumerStatefulWidget {
  const ConfirmViaSMSScreen({
    super.key,
  });

  @override
  ConsumerState<ConfirmViaSMSScreen> createState() =>
      _ConfirmViaSMSScreenState();
}

class _ConfirmViaSMSScreenState extends ConsumerState<ConfirmViaSMSScreen> {
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
                    text: "Enter the confirmation code",
                    color: Colors.white,
                    size: AppSizes.heading5,
                  ),
                  const Gutter(
                    scaleFactor: 0.5,
                  ),
                  const CustomText(
                    text:
                        "To confirm your account, enter the 6-digit code that we sent via SMS to [phoneNumber].",
                    color: Colors.white,
                    size: AppSizes.bodySmaller,
                  ),
                  const Gutter(
                    scaleFactor: 2,
                  ),
                  CustomTextFormField(
                    controller: _numberController,
                    hintText: 'Confirmation code',
                    textColor: Colors.white,
                  ),
                  const Gutter(
                    scaleFactor: 2,
                  ),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const CreatePasswordScreen()));
                    },
                    text: 'Next',
                  ),
                  const Gutter(),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MobileNumberScreen()));
                    },
                    text: 'Try another way ([timer])',
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
