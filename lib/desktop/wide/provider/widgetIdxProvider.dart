import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider =
    StateNotifierProvider<HelloWorldNotifier, int>((ref) {
  return HelloWorldNotifier();
});

class HelloWorldNotifier extends StateNotifier<int> {
  HelloWorldNotifier() : super(-1);

  void updateIdx(int index) {
    state = index;
  }
}
