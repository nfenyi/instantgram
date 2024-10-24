import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/forms/create_password.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../../views/widgets/constants/app_colors.dart';
import '../../../views/widgets/widgets.dart';
import '../welcome_screen.dart';

class ProfilePictureScreen extends ConsumerStatefulWidget {
  const ProfilePictureScreen({
    super.key,
  });

  @override
  ConsumerState<ProfilePictureScreen> createState() =>
      _TermsAndPoliciesScreenState();
}

class _TermsAndPoliciesScreenState extends ConsumerState<ProfilePictureScreen> {
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Add a profile picture",
                    color: Colors.white,
                    size: AppSizes.heading5,
                  ),
                  Gutter(
                    scaleFactor: 0.5,
                  ),
                  CustomText(
                    text:
                        "Add a profile picture so that your friends know it's you. Everyone will be able to see your picture.",
                    color: Colors.white,
                    size: AppSizes.bodySmaller,
                  ),
                  Gutter(
                    scaleFactor: 2,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage(AppAssets.noProfile),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    callback: () async {
                      await showModalBottomSheet(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.6),
                        builder: (BuildContext context) {
                          return Container(
                              width: double.infinity,
                              // height: Adaptive.h(40),
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
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
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        AppSizes.horizontalPaddingSmall),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gutter(
                                      scaleFactor: 0.5,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 40,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const Gutter(),
                                    GestureDetector(
                                      child:
                                          const FaIcon(FontAwesomeIcons.xmark),
                                      onTap: () => Navigator.of(context).pop(),
                                    ),
                                    const Gutter(),
                                    const CustomText(
                                      text: "Add picture",
                                      color: Colors.white,
                                      size: AppSizes.heading5,
                                    ),
                                    const Gutter(),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        // color: const Color.fromARGB(
                                        //     255, 4, 32, 46),
                                        color: Colors.black26.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            child: Padding(
                                              padding: EdgeInsets.all(15.0),
                                              child: CustomText(
                                                text: 'Choose From Gallery',
                                                size: AppSizes.bodySmall,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              child: Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: CustomText(
                                              size: AppSizes.bodySmall,
                                              text: 'Take Photo',
                                              color: Colors.white,
                                            ),
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                              //  CupertinoDatePicker(
                              //   backgroundColor: Colors.white,
                              //   initialDateTime: DateTime.now(),
                              //   maximumDate: DateTime.now(),
                              //   minimumDate: DateTime(1900),
                              //   mode: CupertinoDatePickerMode.date,
                              //   onDateTimeChanged: (DateTime datetime) {
                              //     _dobController.text =
                              //         AppFunctions.formatDate(
                              //       datetime.toIso8601String(),
                              //     );
                              //   },
                              // ),
                              );
                        },
                      );
                    },
                    text: 'Add picture',
                  ),
                  const Gutter(),
                  CustomButton(
                    callback: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                    },
                    text: 'Skip',
                    isSecondary: true,
                    buttonColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
