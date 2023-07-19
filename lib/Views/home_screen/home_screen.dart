import 'package:clone_chat/Views/compose_screen/compose.dart';
import 'package:clone_chat/consts/consts.dart';
import 'package:clone_chat/controllers/home_controller.dart';

import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    var controller = Get.put(HomeController());
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: bgColor,
            onPressed: () {
              Get.to(() => const ComposeScreen(),
                  transition: Transition.downToUp);
            },
            child: const Icon(edite),
          ),
          backgroundColor: bgColor,
          body: Column(
            children: [
              appbar(scaffoldKey),
              Expanded(
                child: Row(
                  children: [
                    tabBar(),
                    tabbarView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
