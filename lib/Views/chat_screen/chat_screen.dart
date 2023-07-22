import 'package:clone_chat/Views/chat_screen/components/chat_bubble.dart';
import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/controllers/chat_controller.dart';
import 'package:clone_chat/sevices/store_services.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        actions: const [
          Icon(
            more,
            color: white,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(22),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "${controller.friendName}\n",
                          style: const TextStyle(
                              fontFamily: semiBold,
                              fontSize: 16,
                              color: Vx.gray800),
                        ),
                        const TextSpan(
                          text: "Lats Seen",
                          style: TextStyle(
                              fontFamily: semiBold,
                              fontSize: 12,
                              color: txtColor),
                        ),
                      ]),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      video,
                      color: white,
                    ),
                  ),
                  10.widthBox,
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      call,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            20.heightBox,
            Obx(
              () => Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(bgColor),
                        ),
                      )
                    : StreamBuilder(
                        stream: StoreServices.getChats(controller.chatId),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              child: Center(
                                child: "Start chat".text.make(),
                              ),
                            );
                          } else {
                            return ListView(
                              children: snapshot.data!.docs
                                  .mapIndexed((currentValue, index) {
                                var doc = snapshot.data!.docs[index];
                                return chatBubble(index, doc);
                              }).toList(),
                            );
                          }
                        },
                      ),
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        controller: controller.messageController,
                        maxLines: 1,
                        style: const TextStyle(
                          color: white,
                          fontSize: 14,
                        ),
                        cursorColor: white,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.attachment_rounded,
                            color: greyColor,
                          ),
                          prefixIcon: Icon(
                            Icons.emoji_emotions_rounded,
                            color: greyColor,
                          ),
                          border: InputBorder.none,
                          hintText: "Type your message here..",
                          hintStyle: TextStyle(
                            fontFamily: semiBold,
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      controller.sendMessage(controller.messageController.text);
                    },
                    child: const CircleAvatar(
                      backgroundColor: btnColor,
                      child: Icon(
                        send,
                        color: white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
