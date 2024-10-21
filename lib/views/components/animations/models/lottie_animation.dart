enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  error(name: 'error'),
  smallError(name: 'small_error'),
  loading(name: 'loading'),
  empty(name: 'empty');

  final String name;
  const LottieAnimation({
    required this.name,
  });
}
