import 'package:instantgram/views/widgets/animations/lottie_animation_view.dart';
import 'package:instantgram/views/widgets/animations/models/lottie_animation.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  const EmptyContentAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.empty,
        );
}
