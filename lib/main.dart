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
    var amountOfchantRoom = 30; //todo: 진짜 방 개수로 바꿔주기
    return Column(
      children: [
        const MenuAndSearch(),
        Expanded(
          child: ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: amountOfchantRoom = 30,
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(context, index) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(
        "대화상대명",
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "최신메세지",
        style: TextStyle(fontSize: 13),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "최근시간",
            style: TextStyle(
              fontSize: 12,
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
              icon: Icon(
                Icons.menu,
                color: Colors.grey.shade400,
              ),
              onPressed: () {
                print("open drawer");
              },
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 1.3,
                      ),
                    ),
                    hintText: 'Search',
                  ),
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
