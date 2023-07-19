import 'package:clone_chat/consts/consts.dart';

class HomeController extends GetxController {
  late SharedPreferences prefs;
  // to access home controller from any controller
  static HomeController instance = Get.find();

  getUserDetails() async {
    await firebaseFirestore
        .collection(collectionUser)
        .where('is', isEqualTo: currentUser!.uid)
        .get()
        .then((value) async {
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
