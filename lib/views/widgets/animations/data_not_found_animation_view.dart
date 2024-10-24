import 'package:instantgram/views/widgets/animations/lottie_animation_view.dart';
import 'package:instantgram/views/widgets/animations/models/lottie_animation.dart';

class DataNotFoundAnimationView extends LottieAnimationView {
  const DataNotFoundAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.dataNotFound,
        );
}
