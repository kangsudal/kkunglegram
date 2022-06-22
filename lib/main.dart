import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
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
          body: ratio >= 1 ? const ChatListWithRoom() : const ChatList(),
        );
      },
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MenuAndSearch(),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(),
              title: Text("대화상대명"),
              subtitle: Text("최신메세지"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "최근메세지 날짜or시간",
                    style: TextStyle(
                      // fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 10,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("쌓여있는메세지개수"),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

class MenuAndSearch extends StatelessWidget {
  const MenuAndSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print("open drawer");
              },
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListWithRoom extends StatelessWidget {
  const ChatListWithRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ChatList(),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text("대화방을 선택해주세요"),
            ),
          ),
        ),
      ],
    );
  }
}
