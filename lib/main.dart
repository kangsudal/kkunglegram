import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:kkunglegram/desktop/layoutBuilderDesktop.dart';
import 'desktop/wide/chatListDesktopWide.dart';
import 'desktop/narrow/chatListDesktopNarrow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kkunglegram',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: InitScreen(),
    );
  }
}

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String os = Platform.operatingSystem;
    if (kIsWeb) {
      return LayoutBuilderDesktop();
    } else if (Platform.isWindows) {
      return LayoutBuilderDesktop();
    } else if (Platform.isAndroid) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            child: Text(
                "android LayoutBuilder or just making scaffold detail"),
          ),
        ),
      );
    } //todo:android version 만들기
    else {
      return SafeArea(
        child: Scaffold(
          body: Container(
            child: Text('''Sorry for
              Platform.isFuchsia
              Platform.isIOS
              Platform.isLinux
              Platform.isMacOS.
              I didn't make your version and test yet.
              '''),
          ),
        ),
      );
    }
    return Container(
      child: Text("Sorry!"),
    );
    // return LayoutBuilder(
    //   builder: (BuildContext context, BoxConstraints constraints) {
    //     final width = constraints.maxWidth;
    //     final height = constraints.maxHeight;
    //     final ratio = width / height;
    //     print(
    //       "width: $width\nheight: $height\naspect ratio: $ratio",
    //     );
    //     return Scaffold(
    //       body: ratio >= 1 ? const ChatListDesktopWide() : const ChatListMobile(),
    //     );
    //   },
    // );
  }
}
