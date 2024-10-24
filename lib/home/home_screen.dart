import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/app_constants/assets.dart';
import 'package:instantgram/views/instantgram_text.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const InstantgramText(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  child: const FaIcon(FontAwesomeIcons.heart),
                ),
                const Gutter()
                // GestureDetector(
                //   child: Image.asset(AppAssets.facebookMessenger),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
