import 'package:clone_chat/consts/consts.dart';

Widget appbar() {
  return Container(
    height: 80,
    color: Colors.white,
    child: Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          height: 80,
          width: 100,
          child: const Icon(
            settingsIcon,
            color: Colors.white,
          ),
        ),
        RichText(
            text: const TextSpan(children: [
          TextSpan(
            text: "$appName\n",
            style:
                TextStyle(fontFamily: bold, fontSize: 22, color: Colors.black),
          ),
          TextSpan(
            text: connectingLives,
            style: TextStyle(
                fontFamily: "lato",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ]))
      ],
    ),
  );
}
