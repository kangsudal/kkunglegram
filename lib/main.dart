import 'package:flutter/material.dart';
import 'desktop/chatListDesktop.dart';
import 'mobile/chatListMobile.dart';

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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final ratio = width / height;
        print(
          "width: $width\nheight: $height\naspect ratio: $ratio",
        );
        return Scaffold(
          body: ratio >= 1 ? const ChatListDesktop() : const ChatListMobile(),
        );
      },
    );
  }
}


