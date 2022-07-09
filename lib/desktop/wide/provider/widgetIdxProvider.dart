import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRoomIdxProvider =
    StateNotifierProvider<ChatRoomIndex, int>((ref) {
  return ChatRoomIndex();
});

class ChatRoomIndex extends StateNotifier<int> {
  ChatRoomIndex() : super(-1);

  void updateIdx(int index) {
    state = index;
  }
}
