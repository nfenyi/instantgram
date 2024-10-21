import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/firebase_options.dart';
import 'package:instantgram/state/auth/models/auth_result.dart';
import 'package:instantgram/state/auth/notifiers/providers/auth_state_provider.dart';
import 'package:instantgram/state/providers/is_loading_provider.dart';

import 'package:instantgram/views/components/loading/loading_screen.dart';
import 'package:instantgram/views/login/login_view.dart';
import 'package:instantgram/views/main/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter App',
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer(builder: (context, ref, child) {
          //take care of displaying the loading screen
          ref.listen<bool>(isLoadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingScreen.instance().show(context: context);
            } else {
              LoadingScreen.instance().hide();
            }
          });
          final isLoggedIn =
              ref.watch(authStateProvider).result == AuthResult.success;
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        })
        //const MainView(),
        );
  }
}

//when you are already logged in
// class MainView extends ConsumerWidget {
//   const MainView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Main View'),
//         ),
//         body: Column(
//           children: [
//             TextButton(
//                 onPressed: () async {
//                   LoadingScreen.instance()
//                       .show(context: context, text: 'Hello ');
//                   await ref.read(authStateProvider.notifier).logOut();
//                 },
//                 child: const Text('Logout'))
//           ],
//         ));
//   }
// }
