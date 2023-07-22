import 'package:clone_chat/consts/consts.dart';

class StoreServices {
  // get user data

  static getUser(String id) {
    return firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: id)
        .get();
  }

  static getAllUsers() {
    return firebaseFirestore.collection(collectionUser).snapshots();
  }

  static getChats(String chatId) {
    return firebaseFirestore
        .collection(collectionChats)
        .doc(chatId)
        .collection(collectionMessages)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getMessages() {
    return firebaseFirestore
        .collection(collectionChats)
        .where("user.${currentUser!.uid}")
        .where("created_on", isNotEqualTo: null)
        .snapshots();
  }
}
