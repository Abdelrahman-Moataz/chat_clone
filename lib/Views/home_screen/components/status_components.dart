import 'package:clone_chat/consts/consts.dart';

import '../../../controllers/home_controller.dart';

Widget statusComponents() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: btnColor,
            backgroundImage: NetworkImage(
              HomeController.instance.userImage,
            ),
            // child: Image.asset(
            //   icUser,
            //   color: white,
            // ),
          ),
          title: "My Status".text.fontFamily(semiBold).color(txtColor).make(),
          subtitle: "Tap to add status update".text.gray400.make(),
        ),
        20.heightBox,
        recentUpdates.text.fontFamily(semiBold).color(txtColor).make(),
        20.heightBox,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: btnColor,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Vx.randomColor,
                    child: Image.asset(icUser),
                  ),
                ),
                title:
                    userName.text.fontFamily(semiBold).color(txtColor).make(),
                subtitle: "Today, 8:47 PM".text.gray400.make(),
              ),
            );
          },
        )
      ],
    ),
  );
}
