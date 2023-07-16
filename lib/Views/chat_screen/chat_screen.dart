import 'package:clone_chat/consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "$userName\n",
                          style: TextStyle(
                              fontFamily: semiBold,
                              fontSize: 16,
                              color: Vx.gray800),
                        ),
                        TextSpan(
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
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return Directionality(
                    textDirection:
                        index.isEven ? TextDirection.rtl : TextDirection.ltr,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: index.isEven ? bgColor : btnColor,
                            child: Image.asset(
                              icUser,
                              color: white,
                            ),
                          ),
                          30.heightBox,
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: index.isEven ? bgColor : btnColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: "Hello, this is a dummy message here.."
                                  .text
                                  .fontFamily(semiBold)
                                  .white
                                  .make(),
                            ),
                          ),
                          10.widthBox,
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: "11:30 AM"
                                  .text
                                  .color(greyColor)
                                  .size(12)
                                  .make()),
                        ],
                      ),
                    ),
                  );
                },
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
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      send,
                      color: white,
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
