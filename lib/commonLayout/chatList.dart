import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kkunglegram/desktop/wide/provider/widgetIdxProvider.dart';

class ChatList extends ConsumerWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var amountOfChatRoom = 30; //todo: 진짜 방 개수로 바꿔주기
    return Column(
      children: [
        const MenuAndSearch(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => itemBuilder(context, index, ref),
            itemCount: amountOfChatRoom,
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(context, index, ref) {
    return Ink(
      height: 70.0,
      child: InkWell(
        onTap: () {
          //선택한 채팅방의 index값을 state에 저장해준다.
          ref.read(helloWorldProvider.notifier).updateIdx(index);
          debugPrint(ref.watch(helloWorldProvider).toString());
        },
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
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
                  children: const [
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
                    const Expanded(
                      child: Text(
                        "시간",
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.grey.shade400,
                          ),
                          child: Center(
                              child: Text(
                            5.toString(), //todo: 진짜값으로 바꾸기
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13),
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
  const MenuAndSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                debugPrint("open drawer");
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
