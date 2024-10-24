import 'package:instantgram/views/widgets/animations/lottie_animation_view.dart';
import 'package:instantgram/views/widgets/animations/models/lottie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.error,
        );
}
