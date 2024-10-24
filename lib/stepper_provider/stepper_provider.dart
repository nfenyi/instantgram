// basic information provider for getting data for inspection
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StepperCountNotifier extends StateNotifier<int> {
  StepperCountNotifier() : super(0);

  int getState() {
    return state;
  }

  void increaseStepCount() {
    state++;
  }

  void decreaseStepCount() {
    state--;
  }

  void jumpStepCount(int step) {
    state = step;
  }
}

final stepperCountProvider = StateNotifierProvider<StepperCountNotifier, int>(
  (ref) => StepperCountNotifier(),
);

// class CarouselStepperNotifier extends StateNotifier<int> {
//   CarouselStepperNotifier() : super(0);
//   void updateStepper(int step) {
//     state = step;
//   }
// }

// final carouselStepperProvider =
//     StateNotifierProvider<CarouselStepperNotifier, int>(
//   (ref) => CarouselStepperNotifier(),
// );
