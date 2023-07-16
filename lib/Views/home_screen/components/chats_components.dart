import 'package:clone_chat/consts/consts.dart';

Widget chatComponents() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: btnColor,
              child: Image.asset(
                icUser,
                color: white,
              ),
            ),
            title: "Dummy Name".text.size(16).make(),
            subtitle: "Message here..".text.make(),
            trailing: "Last seen".text.gray400.make(),
          );
        }),
  );
}
