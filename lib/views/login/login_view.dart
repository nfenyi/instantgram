import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/create_account_screen.dart';
import 'package:instantgram/create_account/screens/forms/mobile_number.dart';
import 'package:instantgram/state/auth/notifiers/providers/auth_state_provider.dart';
import 'package:instantgram/views/widgets/constants/app_colors.dart';
import 'package:instantgram/views/widgets/login/login_view_signup_links.dart';
import 'package:instantgram/views/constants/strings.dart';
import 'package:instantgram/views/login/divider_with_margins.dart';
import 'package:instantgram/views/widgets/widgets.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(Strings.appName),
      // ),
      body: SafeArea(
        child: Expanded(
          child: Stack(children: [
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Icon(Icons.more_horiz),
                          )
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            const Gutter(
                              scaleFactor: 3,
                            ),
                            Image.asset(
                              AppAssets.appLogoOutlined,
                              height: 50,
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              Strings.welcomeToAppName,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const Gutter(
                              scaleFactor: 6,
                            ),
                            // const DividerWithMargins(),
                            // Text(
                            //   Strings.logIntoYourAccount,
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .titleMedium
                            //       ?.copyWith(height: 1.5),
                            // ),
                            // const SizedBox(
                            //   height: 20.0,
                            // ),
                            CustomButton(
                              callback: ref
                                  .read(authStateProvider.notifier)
                                  .logInWithFacebook,
                              // style: TextButton.styleFrom(
                              //     backgroundColor: AppColors.loginButtonColor,
                              //     foregroundColor:
                              //         AppColors.loginButtonTextColor),
                              text: 'Log In',
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     CustomButton(
                            //       iconFirst: true,
                            //       icon: FaIcon(
                            //         FontAwesomeIcons.facebook,
                            //         color: Colors.blue[900],
                            //       ),
                            //       callback: ref
                            //           .read(authStateProvider.notifier)
                            //           .logInWithFacebook,
                            //       // style: TextButton.styleFrom(
                            //       //     backgroundColor: AppColors.loginButtonColor,
                            //       //     foregroundColor:
                            //       //         AppColors.loginButtonTextColor),
                            //       text: 'Facebook',
                            //       buttonColor: Colors.white70,
                            //       textColor: Colors.black,
                            //     ),
                            //     const Gutter(),
                            //     CustomButton(
                            //       iconFirst: true,
                            //       icon: const FaIcon(
                            //         FontAwesomeIcons.google,
                            //         color: Colors.blue,
                            //       ),
                            //       callback: ref
                            //           .read(authStateProvider.notifier)
                            //           .logInWithGoogle,
                            //       // style: TextButton.styleFrom(
                            //       //     backgroundColor: AppColors.loginButtonColor,
                            //       //     foregroundColor:
                            //       //         AppColors.loginButtonTextColor),
                            //       text: 'Google',
                            //       buttonColor: Colors.white70,
                            //       textColor: Colors.black,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: 'Create new account',
                        borderRadius: 10,
                        isSecondary: true,
                        buttonColor: AppColors.primary,
                        callback: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const MobileNumberScreen()));
                        },
                        //   decoration: BoxDecoration(
                        //     border: Border.all(),
                        //   ),
                      ),
                      const Gutter(),
                      Image.asset(
                        AppAssets.metaLogo,
                        height: 20,
                      ),
                      // DividerWithMargins(),
                      // LoginViewSignupLink(),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
