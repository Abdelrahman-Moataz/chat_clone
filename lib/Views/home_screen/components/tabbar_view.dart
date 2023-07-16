import 'package:clone_chat/Views/home_screen/components/chats_components.dart';
import 'package:clone_chat/consts/consts.dart';

Widget tabbarView() {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
        ),
      ),
      child: TabBarView(children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
            ),
            color: white,
          ),
          child: chatComponents(),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
            ),
            color: Colors.yellow,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
            ),
            color: Colors.red,
          ),
        ),
      ]),
    ),
  );
}
