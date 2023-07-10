import 'package:clone_chat/Views/home_screen/components/appbar.dart';
import 'package:clone_chat/consts/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            appbar(),
          ],
        ),
      ),
    );
  }
}
