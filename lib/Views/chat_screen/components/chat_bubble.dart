import 'package:clone_chat/consts/consts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../controllers/home_controller.dart';

Widget chatBubble(index, DocumentSnapshot doc) {
  var t =
      doc['created_on'] == null ? DateTime.now() : doc['created_on'].toDate();
  var time = intl.DateFormat("h:mm").format(t);

  return Directionality(
    textDirection:
        doc['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                doc['uid'] == currentUser!.uid ? bgColor : btnColor,
            backgroundImage: NetworkImage(doc['uid'] == currentUser!.uid
                ? HomeController.instance.userImage
                : HomeController.instance.friendImage),
          ),
          30.heightBox,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: doc['uid'] == currentUser!.uid ? bgColor : btnColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: "${doc['msg']}".text.fontFamily(semiBold).white.make(),
            ),
          ),
          10.widthBox,
          Directionality(
              textDirection: TextDirection.ltr,
              child: time.text.color(greyColor).size(12).make()),
        ],
      ),
    ),
  );
}
