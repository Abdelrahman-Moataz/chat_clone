import 'package:clone_chat/consts/consts.dart';

class HomeController extends GetxController {
  late SharedPreferences prefs;
  // to access home controller from any controller
  static HomeController instance = Get.find();
  String userName = '';
  String userImage = '';

  String friendName = '';
  String friendImage = '';

  getUserDetails() async {
    await firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) async {
      userName = value.docs[0]['name'];
      userImage = value.docs[0]['image_url'];
      prefs = await SharedPreferences.getInstance();
      prefs.setStringList('user_details', [
        value.docs[0]['name'],
        value.docs[1]['image_url'],
      ]);
    });
  }

  getFriendDetails() async {
    await firebaseFirestore
        .collection(collectionUser)
        .where('id', isNotEqualTo: currentUser!.uid)
        .get()
        .then((value) async {
      friendName = value.docs[0]['name'];
      friendImage = value.docs[0]['image_url'];
      prefs = await SharedPreferences.getInstance();
      prefs.setStringList('user_details', [
        value.docs[0]['name'],
        value.docs[1]['image_url'],
      ]);
    });
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}
