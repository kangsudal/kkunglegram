import 'package:flutter/material.dart';
import 'package:kkunglegram/desktop/narrow/chatListDesktopNarrow.dart';
import 'package:kkunglegram/desktop/wide/chatListDesktopWide.dart';

class LayoutBuilderDesktop extends StatelessWidget {
  const LayoutBuilderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final ratio = width / height;
        print(
          "width: $width\nheight: $height\naspect ratio: $ratio",
        );
        return Scaffold(
          body: ratio >= 1 ? const ChatListDesktopWide() : const ChatListMobile(),
        );
      },
    );
  }
}
