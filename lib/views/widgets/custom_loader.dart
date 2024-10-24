part of 'widgets.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.color = Colors.white, // Set default color to white
    this.size = 30.0, // Set default size to 30
  });

  final Color color; // Define color variable
  final double size; // Define size variable

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: LoadingAnimationWidget.hexagonDots(
        color: color,
        size: size,
      ),
    );
  }
}
