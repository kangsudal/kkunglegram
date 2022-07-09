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
        const Expanded(
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
            child: const Center(
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
    int chatRoomIdx = ref.watch(chatRoomIdxProvider);

    if (chatRoomIdx >= 0) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("대화상대"),
              Text(
                "최근 접속 시간/참여자 몇명",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: actions(),
        ),
        body: Text("Room $chatRoomIdx"),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
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

  List<Widget> actions() {
    return [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.speaker_notes_rounded,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_open,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ];
  }
}
