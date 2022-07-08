import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kkunglegram/commonLayout/chatList.dart';
import 'package:kkunglegram/desktop/wide/provider/widgetIdxProvider.dart';

class ChatListDesktopWide extends StatelessWidget {
  const ChatListDesktopWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ChatList(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/pandas_1280.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: ChatRoom(),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatRoom extends ConsumerWidget {
  const ChatRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int value = ref.watch(helloWorldProvider);

    if (value >= 0) {
      return IndexedStack(
        index: value,
        children: List.generate(
          30,
          (index) => Container(
            child: Text(index.toString()),
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: const Text(
          "대화할 방을 선택하세요.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color(0x6A000000),
        ),
      );
    }
  }
}
