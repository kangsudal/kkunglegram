import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var amountOfChatRoom = 30; //todo: 진짜 방 개수로 바꿔주기
    return Column(
      children: [
        MenuAndSearch(),
        Expanded(
          child: ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: amountOfChatRoom,
          ),
        ),
      ],
    );
  }

  int _selectedIndex = -1;

  Widget itemBuilder(context, index) {
    return Ink(
      height: 70.0,
      child: InkWell(
        onTap: () {
          _selectedIndex = index;
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        "대화상대",
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "최근 메세지",
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        "시간",
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.grey.shade400,
                          ),
                          child: Center(
                              child: Text(
                            5.toString(),//todo: 진짜값으로 바꾸기
                            style:
                                TextStyle(color: Colors.white, fontSize: 13),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
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
