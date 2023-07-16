import 'package:clone_chat/consts/consts.dart';

Widget appbar(GlobalKey<ScaffoldState> key) {
  return Container(
    padding: const EdgeInsets.only(right: 12),
    height: 80,
    color: white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Container(
            decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            height: 70,
            width: 80,
            child: const Icon(
              settingsIcon,
              color: white,
            ),
          ),
        ),
        RichText(
            text: const TextSpan(children: [
          TextSpan(
            text: "$appName\n",
            style:
                TextStyle(fontFamily: bold, fontSize: 22, color: Colors.black),
          ),
          // TextSpan(
          //   text: "                              $connectingLives",
          //   style: TextStyle(
          //       fontFamily: "lato",
          //       fontSize: 12,
          //       color: Vx.gray600,
          //       fontWeight: FontWeight.w600),
          // ),
        ])),
        CircleAvatar(
          backgroundColor: btnColor,
          radius: 25,
          child: Image.asset(
            icUser,
            color: white,
          ),
        ),
      ],
    ),
  );
}
