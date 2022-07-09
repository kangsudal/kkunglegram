import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kkunglegram/desktop/layoutBuilderDesktop.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const InitScreen(),
    );
  }
}

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String os = Platform.operatingSystem;
    if (kIsWeb) {
      return const LayoutBuilderDesktop();
    } else if (Platform.isWindows) {
      return const LayoutBuilderDesktop();
    } else if (Platform.isAndroid) {
      return const SafeArea(
        child: Scaffold(
          body: Text("android LayoutBuilder or just making scaffold detail"),
        ),
      );
    } //todo:android version 만들기
    else {
      return const SafeArea(
        child: Scaffold(
          body: Text('''Sorry for
            Platform.isFuchsia
            Platform.isIOS
            Platform.isLinux
            Platform.isMacOS.
            I didn't make your version and test yet.
            '''),
        ),
      );
    }
  }
}
