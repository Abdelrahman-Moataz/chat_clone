import 'package:clone_chat/consts/consts.dart';

class ProfileController extends GetxController {
  // text Editing controller
  var nameController = TextEditingController();
  var aboutController = TextEditingController();
  var phoneController = TextEditingController();

  // update profile method
  updateProfile(context) async {
    // setting store variable to the document of our current user
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);

    //lets update the data
    await store.set({
      'name': nameController.text,
      'about': aboutController.text,
    }, SetOptions(merge: true));
    // show toast when done
    VxToast.show(context, msg: "Profile updated successfully");
  }
}
