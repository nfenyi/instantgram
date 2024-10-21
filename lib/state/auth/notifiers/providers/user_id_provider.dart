import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instantgram/state/auth/notifiers/providers/auth_state_provider.dart';

final userIdProvider = Provider((ref) => ref.watch(authStateProvider).userId);
