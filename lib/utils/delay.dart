Future<void> delay(Duration duration) {
  print('3 sec waited');
  return Future.delayed(duration);
}
