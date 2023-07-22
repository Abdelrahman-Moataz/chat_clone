import 'package:clone_chat/Views/home_screen/components/message_bubble.dart';
import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/sevices/store_services.dart';

Widget chatComponents() {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: StreamBuilder(
          stream: StoreServices.getMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(bgColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              //if no message found
              return Center(
                child: "Start a conversation.."
                    .text
                    .fontFamily(semiBold)
                    .color(txtColor)
                    .make(),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                  var doc = snapshot.data!.docs[index];
                  return messageBubble(doc);
                }).toList(),
              );
            }
          }));
}
