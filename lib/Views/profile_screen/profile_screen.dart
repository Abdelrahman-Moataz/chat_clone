import 'dart:io';

import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/controllers/profile_controller.dart';
import 'package:clone_chat/sevices/store_services.dart';

import 'components/picker_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // init profile controller
    var controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: profile.text.fontFamily(bold).make(),
        backgroundColor: transparent,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () async {
                if (controller.imagePath.isEmpty) {
                  // if image is selected then only update the values
                  controller.updateProfile(context);
                } else {
                  await controller.uploadImage();
                  controller.updateProfile(context);
                }
              },
              child: "Save".text.white.fontFamily(semiBold).make()),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            // init future builder
            child: FutureBuilder(
              future: StoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                // if data is loaded show the widget
                if (snapshot.hasData) {
                  // setting snapshot into a variable for each access
                  //here doc[0] cuz it will contain only one document
                  var data = snapshot.data!.docs[0];
                  // setting value to the text controller
                  controller.nameController.text = data['name'];
                  controller.phoneController.text = data['phone'];
                  controller.aboutController.text = data['about'];
                  return Column(
                    children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 80,
                          backgroundColor: bgColor,
                          child: Stack(
                            children: [
                              //when image path is empty
                              controller.imagePath.isEmpty &&
                                      data['image_url'] == ''
                                  ? Image.asset(icUser, color: white)
                                  : controller.imagePath.isNotEmpty
                                      ? Image.file(
                                              File(controller.imagePath.value))
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make()
                                      : Image.network(
                                          data['image_url'],
                                        )
                                          .box
                                          .roundedFull
                                          .clip(Clip.antiAlias)
                                          .make(),
                              Positioned(
                                right: 0,
                                bottom: 20,
                                child: CircleAvatar(
                                  radius: 15,
                                  child: const Icon(
                                    Icons.camera_alt_rounded,
                                    color: white,
                                    size: 15,
                                  ).onTap(() {
                                    Get.dialog(
                                      pickDialog(context, controller),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.heightBox,
                      const Divider(
                        color: btnColor,
                        height: 1,
                      ),
                      10.heightBox,
                      ListTile(
                        leading: const Icon(
                          icPerson,
                          color: white,
                        ),
                        title: TextFormField(
                          controller: controller.nameController,
                          style: const TextStyle(color: white, fontSize: 14),
                          cursorColor: white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: const Icon(
                              edite,
                              color: white,
                            ),
                            label: name.text.white.make(),
                            isDense: true,
                            labelStyle: const TextStyle(fontFamily: semiBold),
                          ),
                        ),
                        subtitle:
                            nameSub.text.fontFamily(semiBold).gray400.make(),
                      ),
                      ListTile(
                        leading: const Icon(
                          info,
                          color: white,
                        ),
                        title: TextFormField(
                          controller: controller.aboutController,
                          style: const TextStyle(color: white, fontSize: 14),
                          cursorColor: white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: const Icon(
                              edite,
                              color: white,
                            ),
                            label: about.text.white.make(),
                            isDense: true,
                            labelStyle: const TextStyle(fontFamily: semiBold),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          call,
                          color: white,
                        ),
                        title: TextFormField(
                          controller: controller.phoneController,
                          style: const TextStyle(color: white, fontSize: 14),
                          readOnly: true,
                          cursorColor: white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // suffixIcon: const Icon(
                            //   edite,
                            //   color: white,
                            // ),
                            label: phone.text.white.make(),
                            isDense: true,
                            labelStyle: const TextStyle(fontFamily: semiBold),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(white),
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}
