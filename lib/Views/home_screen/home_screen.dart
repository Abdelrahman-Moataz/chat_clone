import 'package:clone_chat/consts/consts.dart';

import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: bgColor,
            onPressed: () {},
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
