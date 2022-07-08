import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var amountOfchantRoom = 30; //todo: 진짜 방 개수로 바꿔주기
    return Column(
      children: [
        MenuAndSearch(),
        Expanded(
          child: ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: amountOfchantRoom = 30,
          ),
        ),
      ],
    );
  }

  int _selectedIndex = 0;
  Widget itemBuilder(context, index) {
    return GestureDetector(
      onTap: () {
        _selectedIndex = index;
      },
      child: ListTile(
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
      ),
    );
  }
}

class MenuAndSearch extends StatelessWidget {
  MenuAndSearch({
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
