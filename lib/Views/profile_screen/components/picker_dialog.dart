import 'package:clone_chat/consts/consts.dart';
import 'package:image_picker/image_picker.dart';

Widget pickDialog(context, controller) {
  var listTitle = [camera, gallery, cancel];
  var icons = [
    Icons.camera_alt_rounded,
    Icons.photo_size_select_actual_rounded,
    Icons.cancel_rounded
  ];

  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: const EdgeInsets.all(12),
      color: bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          source.text.fontFamily(semiBold).white.make(),
          const Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              3,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    //on tap for camera
                    case 0:
                      //providing camera source
                      Get.back();
                      controller.pickImage(context, ImageSource.camera);
                      break;
                    //on tap for gallery
                    case 1:
                      //providing gallery source
                      Get.back();
                      controller.pickImage(context, ImageSource.gallery);
                      break;
                    //on tap for cancel
                    case 2:
                      Get.back();
                      break;
                  }
                },
                leading: Icon(
                  icons[index],
                  color: white,
                ),
                title: listTitle[index].text.white.make(),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
