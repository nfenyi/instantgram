import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/app_sizes.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/create_account/screens/black_screens/allow_contacts_access.dart';
import 'package:instantgram/views/widgets/rich_text/custom_text.dart';

//TODO: make the column expand to the entire area of the screen
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) => startTime());
  }

  Future<void> startTime() async {
    // Delay before executing the rest of the code
    await Future.delayed(const Duration(seconds: 2, milliseconds: 500));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AllowContactsAccessScreen(),
        ),
      );
    }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Instantgram",
                style: GoogleFonts.dancingScript(
                  fontSize: AppSizes.heading4,
                  fontWeight: FontWeight.w900,
                ),
              )),
              const Gutter(
                scaleFactor: 8,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(AppAssets.noProfile),
                ),
              ),
              const Gutter(
                scaleFactor: 5,
              ),
              const CustomText(
                text: "Welcome to Instantgram, [username]",
                color: Colors.white,
                size: AppSizes.heading6,
              ),
              const Gutter(
                scaleFactor: 1,
              ),
              const CustomText(
                text: "Let's start customising your experience.",
                color: Colors.white,
                size: AppSizes.bodySmaller,
              ),
              const Gutter(
                scaleFactor: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
