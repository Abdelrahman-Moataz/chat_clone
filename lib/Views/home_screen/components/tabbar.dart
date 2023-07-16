import 'package:clone_chat/consts/consts.dart';

Widget tabBar() {
  return Container(
    child: const RotatedBox(
      quarterTurns: 3,
      child: TabBar(
        labelColor: white,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelColor: Vx.gray500,
        indicator: BoxDecoration(),
        tabs: [
          Tab(
            text: chats,
          ),
          Tab(
            text: status,
          ),
          Tab(
            text: camera,
          )
        ],
      ),
    ),
  );
}
