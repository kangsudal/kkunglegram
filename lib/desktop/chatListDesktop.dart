import 'package:flutter/material.dart';
import 'package:kkunglegram/commonLayout/chatList.dart';

class ChatListDesktop extends StatelessWidget {
  const ChatListDesktop({Key? key}) : super(key: key);

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
            child: Center(
              child: Container(
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}