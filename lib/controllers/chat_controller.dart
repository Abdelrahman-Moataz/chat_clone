import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/controllers/home_controller.dart';

class ChatController extends GetxController {
  dynamic chatId;
  var chats = firebaseFirestore.collection(collectionChats);
  var userId = currentUser!.uid;
  var friendId = Get.arguments[1];
  var userName =
      HomeController.instance.prefs.getStringList('user_details')![0];
  var friendName = Get.arguments[0];
  var messageController = TextEditingController();

  getChatId() async {
    await chats
        .where('users', isEqualTo: {friendId: null, userId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) async {
          if (snapshot.docs.isNotEmpty) {
            // if chatroom is already created then assign the id to out chatId var
            chatId = snapshot.docs.single.id;
          } else {
            // if no room is created then create one
            chats.add({
              'users': {userId: null, friendId: null},
              'friend_name': friendName,
              'user_name': userName,
              'toId': '',
              'fromId': '',
              'created_on': null,
              'last_msg': '',
            }).then((value) {
              //assign the doc id to our chatid var
              {
                chatId = value.id;
              }
            });
          }
        });
  }

  @override
  void onInit() {
    getChatId();
    super.onInit();
  }
}
