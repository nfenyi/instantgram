import 'package:instantgram/views/widgets/animations/lottie_animation_view.dart';
import 'package:instantgram/views/widgets/animations/models/lottie_animation.dart';

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.smallError,
        );
}
