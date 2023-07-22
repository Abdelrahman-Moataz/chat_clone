import 'package:clone_chat/consts/consts.dart';
import 'package:intl/intl.dart' as intl;

import '../../chat_screen/chat_screen.dart';

Widget messageBubble(DocumentSnapshot doc) {
  var t =
      doc['created_on'] == null ? DateTime.now() : doc['created_on'].toDate();
  var time = intl.DateFormat("h:mm").format(t);
  return Card(
    child: ListTile(
      onTap: () {
        Get.to(() => const ChatScreen(),
            transition: Transition.downToUp,
            arguments: [
              currentUser!.uid == doc['toId']
                  ? doc['user_name']
                  : doc['friend_name'],
              currentUser!.uid == doc['toId'] ? doc['fromId'] : doc['toId'],
            ]);
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: btnColor,
        child: Image.asset(
          icUser,
          color: white,
        ),
      ),
      title: currentUser!.uid == doc['toId']
          ? "${doc['user_name']}".text.fontFamily(semiBold).size(14).make()
          : "${doc['friend_name']}".text.size(16).make(),
      subtitle: "${doc['last_msg']}".text.maxLines(1).make(),
      trailing: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          onPressed: null,
          icon: const Icon(
            Icons.access_time_filled_rounded,
            size: 16,
            color: Vx.gray400,
          ),
          label: time.text.color(Vx.gray400).size(12).make(),
        ),
      ),
    ),
  );
}
