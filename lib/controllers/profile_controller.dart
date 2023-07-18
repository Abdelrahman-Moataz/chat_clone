import 'dart:io';

import 'package:clone_chat/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  // text Editing controller
  var nameController = TextEditingController();
  var aboutController = TextEditingController();
  var phoneController = TextEditingController();

  // variable for image

  var imagePath = ''.obs;
  var imageLink = '';

  // update profile method
  updateProfile(context) async {
    // setting store variable to the document of our current user
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);

    //lets update the data
    await store.set({
      'name': nameController.text,
      'about': aboutController.text,
      'image_url': imageLink,
    }, SetOptions(merge: true));
    // show toast when done
    VxToast.show(context, msg: "Profile updated successfully");
  }

  pickImage(context, source) async {
    // get permission from user
    await Permission.photos.request();
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.locationWhenInUse.request();

    // getting state of our permission to handle
    var status = await Permission.camera.status;

    //handle status
    if (status.isGranted) {
      //when status is granted
      try {
        // source will be according to user choice
        //picking image and saving in img var
        final img =
            await ImagePicker().pickImage(source: source, imageQuality: 80);
        //setting our variable equal to image path
        imagePath.value = img!.path;
        //showing toast after picking image
        VxToast.show(context, msg: "Image selected");
      } on PlatformException catch (e) {
        VxToast.show(context, msg: e.toString());
      }
    } else {
      VxToast.show(context, msg: "Permission denied");
    }
  }

  uploadImage() async {
    var name = basename(imagePath.value);
    var destination = 'images/${currentUser!.uid}/$name';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(imagePath.value));
    var d = await ref.getDownloadURL();
    imageLink = d;
  }
}
