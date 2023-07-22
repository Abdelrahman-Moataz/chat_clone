import 'package:clone_chat/consts/consts.dart';

class HomeController extends GetxController {
  late SharedPreferences prefs;
  // to access home controller from any controller
  static HomeController instance = Get.find();
  String userName = '';
  String userImage = '';

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
        value.docs[0]['image_url'],
      ]);
    });
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}
