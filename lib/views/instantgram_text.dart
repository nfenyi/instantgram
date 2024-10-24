import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_constants/app_sizes.dart';

class InstantgramText extends StatelessWidget {
  const InstantgramText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Instantgram",
        style: GoogleFonts.dancingScript(
          fontSize: AppSizes.heading4,
          fontWeight: FontWeight.w900,
        ));
  }
}
