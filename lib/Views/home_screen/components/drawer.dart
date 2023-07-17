import 'package:clone_chat/Views/profile_screen/profile.dart';
import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/main.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: bgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(25)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              backIcon,
              color: Colors.white,
            ).onTap(() {
              Get.back();
            }),
            title: settings.text.fontFamily(semiBold).white.make(),
          ),
          20.heightBox,
          CircleAvatar(
            radius: 45,
            backgroundColor: btnColor,
            child: Image.asset(
              icUser,
              color: white,
            ),
          ),
          20.heightBox,
          userName.text.fontFamily(semiBold).white.size(16).make(),
          20.heightBox,
          const Divider(
            color: btnColor,
            height: 0.5,
          ),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
                drawerIconsList.length,
                (index) => ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const ProfileScreen(),
                                transition: Transition.downToUp);
                            break;
                        }
                      },
                      leading: Icon(
                        drawerIconsList[index],
                        color: white,
                      ),
                      title: drawerListTitles[index]
                          .text
                          .fontFamily(semiBold)
                          .white
                          .make(),
                    )),
          ),
          10.heightBox,
          const Divider(
            color: btnColor,
            height: 0.5,
          ),
          10.heightBox,
          ListTile(
            leading: const Icon(
              inviteIcon,
              color: white,
            ),
            title: invite.text.fontFamily(semiBold).white.make(),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              await auth.signOut();
              Get.offAll(() => const ChatApp());
            },
            leading: const Icon(
              logoutIcon,
              color: white,
            ),
            title: logout.text.fontFamily(semiBold).white.make(),
          )
        ],
      ),
    ),
  );
}
